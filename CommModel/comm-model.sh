#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N comm-model
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o comm-model.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=20:00:00
cd $PBS_O_WORKDIR

extract-stations.py data.final.h5 P447 P433 P386 P022 P394

pygeons reml P447-P433-P386-P022-P394.h5 \
        --network-model exp-p0 \
        --network-params 0.5 1e-10 \
        --network-fix 1 \
        --station-model p0 p1 per fogm \
        --station-params 1.0 1.0 \
        --output-stem P447-P433-P386-P022-P394.reml \
        -vv &> P447-P433-P386-P022-P394.reml.log 
          
