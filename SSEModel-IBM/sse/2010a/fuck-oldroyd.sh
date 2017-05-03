#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N foo
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o foo.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00
cd $PBS_O_WORKDIR

pygeons fit -vv data.h5 \
        --network-model ibm-se \
        --network-params east 2.0768e+02 5.4832e+04 9.8151e+01 \
                         north 9.6985e+01 5.4832e+04 1.5879e+02 \
                         vertical 100.0 5.4832e+04 100.0 \
        --station-model p0 p1 fogm \
        --station-params east 6.3000e-01 2.3000e-01 \
                         north 4.4000e-01 4.0000e-02 \
                         vertical 1.1200e+01 1.1500e+00 \
        -vv

