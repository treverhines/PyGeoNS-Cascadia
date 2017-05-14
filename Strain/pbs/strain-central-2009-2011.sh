#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N strain-central-2009-2011
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o log/strain-central-2009-2011.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00
cd $PBS_O_WORKDIR
pygeons strain data/central/2009-2011/data.h5 \
        --network-prior-model spwen12-se \
        --network-prior-params 1.0 0.1 100.0 \
        --station-noise-model p0 p1 per \
        --station-noise-params \
        --no-uncertainty \
        -vv &> /scratch/ehetland_flux/hinest/strain-central-2009-2011.log
