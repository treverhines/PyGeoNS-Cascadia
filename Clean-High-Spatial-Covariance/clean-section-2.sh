#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N clean-section-2
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o clean-section-2.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=10:00:00
cd $PBS_O_WORKDIR

# this script cleans data in the south-east section of the Pacific
# Northwest

FILE="data-2017-04-26.h5"
MIN_LON="-121.0"
MAX_LAT="42.0"
MIN_LAT="40.0"

mkdir -p work/section-2/2016-2017
mkdir -p work/section-2/2015-2016
mkdir -p work/section-2/2014-2015
mkdir -p work/section-2/2013-2014
mkdir -p work/section-2/2012-2013
mkdir -p work/section-2/2011-2012
mkdir -p work/section-2/2010-2011

for i in `seq 0 1 6`
  do
  ip1=$((i+1))
  pygeons crop $FILE \
          --max-lat $MAX_LAT \
          --min-lat $MIN_LAT \
          --min-lon $MIN_LON \
          --start-date 201$i-01-01 \
          --stop-date 201$ip1-01-01 \
          --output-stem work/section-2/201$i-201$ip1/data \
          -vv &>> work/section-2.log
  pygeons autoclean work/section-2/201$i-201$ip1/data.h5 \
          --output-stem work/section-2/201$i-201$ip1/data.clean \
          --network-params 5.0 0.05 100.0 \
          -vv &>> work/section-2.log
  done

pygeons merge work/section-2/2010-2011/data.clean.h5 \
              work/section-2/2011-2012/data.clean.h5 \
              work/section-2/2012-2013/data.clean.h5 \
              work/section-2/2013-2014/data.clean.h5 \
              work/section-2/2014-2015/data.clean.h5 \
              work/section-2/2015-2016/data.clean.h5 \
              work/section-2/2016-2017/data.clean.h5 \
        --output-stem work/section-2/data.clean.merged \
        -vv &>> work/section-2.log
