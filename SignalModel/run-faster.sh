#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N signal-model-fast
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o out.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00
cd $PBS_O_WORKDIR

pygeons reml sse2015.h5 \
        --network-model se-se \
        --network-params 1.0 0.05 50.0 \
        --station-model p0 p1 per fogm \
        --station-params east     0.63 0.23 \
                         north    0.44 0.04 \
                         vertical 11.2 1.15 \
        --station-fix 0 1 2 \
        --output-stem sse2015-fast \
        -vv &>> signal-model-fast.log   
