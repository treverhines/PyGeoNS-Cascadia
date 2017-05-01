#!/bin/bash
#PBS -A ehetland_flux
#PBS -M hinest@umich.edu
#PBS -N test_run
#PBS -m abe
#PBS -V
#PBS -j oe
#PBS -o test_run.log
#PBS -q flux
#PBS -l qos=flux
#PBS -l nodes=1:ppn=8,mem=16000mb,walltime=1:00:00
cd $PBS_O_WORKDIR

python test_cbasis.py
