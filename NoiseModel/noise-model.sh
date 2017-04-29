#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N noise-model
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o noise-model.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=2,mem=8000mb,walltime=20:00:00
cd $PBS_O_WORKDIR

FILE=data.clean.merged.h5
STATIONS="BAMO BREW BURN DRAO GARL GOBS LEWI \
          LINH P013 P017 P018 P020 P021 P022 \
          P063 P065 P078 P083 P085 P137 P138 \
          P145 P148 P151 P347 P372 P381 P386 \
          P388 P389 P390 P391 P392 P393 P394 \
          P413 P422 P433 P445 P447 P448 P449 \
          P450 P451 P452 P453 P454 P730 P731 \
          P738 P739 P813 P814 SC00 SHIN SHLD \
          TUNG"



mkdir -p stations
mkdir -p results
mkdir -p logs
for s in $STATIONS
  do
  extract-stations.py $FILE $s
  mv $s.h5 stations/$s.h5
  pygeons reml stations/$s.h5 \
          --network-model \
          --network-params \
          --station-model p0 p1 per fogm \
          --station-params 1.0 1.0 \
          --output-stem results/$s \
          -v &> logs/$s.log
  done


