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

pygeons fit data.h5 \
        --network-model mat32-se \
        --network-params east 6.7813e-01 4.0033e-02 8.3244e+01 \
                         north 5.2145e-01 5.4980e-02 9.8612e+01 \
                         vertical 2.6912e+00 4.3017e-03 inf \
        --station-model p0 p1 fogm \
        --station-params east 6.3000e-01 2.3000e-01 \
                         north 4.4000e-01 4.0000e-02 \
                         vertical 1.1200e+01 1.1500e+00 \
        -vv

