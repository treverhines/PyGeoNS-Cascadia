#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N signal-model-longts
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o signal-model-longts.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00
cd $PBS_O_WORKDIR

pygeons crop data.clean.merged.h5 \
        --start-date 2015-10-01 \
        --stop-date 2016-05-01 \
        --output-stem work/sse2015-longts \
        -vv &>> work/sse2015-longts.log

pygeons reml work/sse2015-longts.h5 \
        --network-model se-se \
        --network-params 1.0 0.05 50.0 \
        --station-model p0 p1 per fogm \
        --station-params east     0.63 0.23 \
                         north    0.44 0.04 \
                         vertical 11.2 1.15 \
        --station-fix 0 1 2 \
        -vv &>> work/sse2015-longts.log
