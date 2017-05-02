#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N sse-model-2013b
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o sse-model-2013b.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00
cd $PBS_O_WORKDIR

pygeons reml sse/2013b/data.h5 \
          --network-model mat32-se \
          --network-params 1.0 0.05 50.0 \
          --station-model p0 p1 fogm \
          --station-params east     0.63 0.23 \
                           north    0.44 0.04 \
                           vertical 11.2 1.15 \
          --station-fix 0 1 2 \
          -vv &> sse/2013b.log

