#!/bin/bash

# Download the station csv files from unavco.org
python scripts/download_data.py

# Combine the station csv files
mkdir -p work
sed -s '$a***' csv/*.csv | sed '$d' > work/data.csv

# Convert csv file to an HDF5 file
pygeons toh5 "work/data.csv" \
             --file-type "pbocsv" \
             -vv

# crops out stations outside the area of interest
pygeons crop "work/data.h5" \
             --start-date "2009-01-01" \
             --stop-date "2017-05-01" \
             --min-lat "39.5" \
             --max-lat "50.0" \
             --max-lon "-116.5" \
             -vv

# remove data with high uncertainty
python scripts/remove_high_sigma.py work/data.crop.h5

# get the latest record of known steps
wget http://geodesy.unr.edu/NGLStationPages/steps.txt
mv steps.txt work/steps.txt

# convert step file to edits file
python scripts/make_edits.py work/steps.txt
mv edits.log work/edits.log

# remove steps from the dataset
pygeons clean work/data.crop.h5 \
              --output-stem "data" \
              --input-edits-file "work/edits.log" \
              --no-display \
              -vv
