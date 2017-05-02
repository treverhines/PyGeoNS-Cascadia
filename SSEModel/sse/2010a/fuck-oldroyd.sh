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

pygeons fit data.h5 --network-model se-se --network-params east 5.4581e-01 2.2458e-02 8.0226e+01 north 4.0964e-01 2.9630e-02 9.2756e+01 vertical 2.5274e+00 2.5836e-03 4.6480e+14 --station-model p0 p1 fogm --station-params east 6.3000e-01 2.3000e-01 north 4.4000e-01 4.0000e-02 vertical 1.1200e+01 1.1500e+00 -vv

