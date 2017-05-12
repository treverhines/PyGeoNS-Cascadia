#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N sse-model-2011a
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o sse-model-2011a.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00
cd $PBS_O_WORKDIR

pygeons reml sse/2011a/data.h5 \
          --network-model wen12-se \
          --network-params 1.0 0.05 50.0 \
          --station-model p0 p1 \
          --station-params \
          --station-fix \
          -vv &> sse/2011a.log

