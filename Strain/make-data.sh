#!/bin/bash

mkdir -p log
mkdir -p pbs

for yr in 2009 2011 2013 2015 2017
  do
  yrp2=$((yr+2))
  mkdir -p data/north/$yr-$yrp2
  mkdir -p data/central/$yr-$yrp2
  mkdir -p data/south/$yr-$yrp2

  # north secion
  pygeons crop data.final.h5 \
          --start-date $yr-07-01 \
          --stop-date $yrp2-07-01 \
          --min-lat 45.5 \
          --output-stem data/north/$yr-$yrp2/data \
          -vv


  # central secion
  pygeons crop data.final.h5 \
          --start-date $yr-07-01 \
          --stop-date $yrp2-07-01 \
          --max-lat 47.0 \
          --min-lat 43.0 \
          --output-stem data/central/$yr-$yrp2/data \
          -vv

  # south secion
  pygeons crop data.final.h5 \
          --start-date $yr-07-01 \
          --stop-date $yrp2-07-01 \
          --max-lat 44.5 \
          --output-stem data/south/$yr-$yrp2/data \
          -vv

  NAME=strain-north-$yr-$yrp2
  PBS_FILE=pbs/$NAME.sh
  DATA_FILE=data/north/$yr-$yrp2/data.h5
  # write a pbs script for it
  echo "#!/bin/bash" > $PBS_FILE
  echo "#PBS -A ehetland_flux" >> $PBS_FILE
  echo "#PBS -M hinest@umich.edu" >> $PBS_FILE
  echo "#PBS -N "$NAME >> $PBS_FILE
  echo "#PBS -m abe" >> $PBS_FILE
  echo "#PBS -V" >> $PBS_FILE
  echo "#PBS -j oe" >> $PBS_FILE
  echo "#PBS -o log/"$NAME".log" >> $PBS_FILE
  echo "#PBS -q flux" >> $PBS_FILE
  echo "#PBS -l qos=flux" >> $PBS_FILE
  echo "#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00" >> $PBS_FILE
  echo "cd \$PBS_O_WORKDIR" >> $PBS_FILE
  echo "pygeons strain "$DATA_FILE" \\" >> $PBS_FILE
  echo "        --network-prior-model spwen12-se \\" >> $PBS_FILE
  echo "        --network-prior-params 1.0 0.1 100.0 \\" >> $PBS_FILE
  echo "        --station-noise-model p0 p1 per \\" >> $PBS_FILE
  echo "        --station-noise-params \\" >> $PBS_FILE
  echo "        --no-uncertainty \\" >> $PBS_FILE
  echo "        -vv &> /scratch/ehetland_flux/hinest/"$NAME".log" >> $PBS_FILE

  NAME=strain-central-$yr-$yrp2
  PBS_FILE=pbs/$NAME.sh
  DATA_FILE=data/central/$yr-$yrp2/data.h5
  # write a pbs script for it
  echo "#!/bin/bash" > $PBS_FILE
  echo "#PBS -A ehetland_flux" >> $PBS_FILE
  echo "#PBS -M hinest@umich.edu" >> $PBS_FILE
  echo "#PBS -N "$NAME >> $PBS_FILE
  echo "#PBS -m abe" >> $PBS_FILE
  echo "#PBS -V" >> $PBS_FILE
  echo "#PBS -j oe" >> $PBS_FILE
  echo "#PBS -o log/"$NAME".log" >> $PBS_FILE
  echo "#PBS -q flux" >> $PBS_FILE
  echo "#PBS -l qos=flux" >> $PBS_FILE
  echo "#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00" >> $PBS_FILE
  echo "cd \$PBS_O_WORKDIR" >> $PBS_FILE
  echo "pygeons strain "$DATA_FILE" \\" >> $PBS_FILE
  echo "        --network-prior-model spwen12-se \\" >> $PBS_FILE
  echo "        --network-prior-params 1.0 0.1 100.0 \\" >> $PBS_FILE
  echo "        --station-noise-model p0 p1 per \\" >> $PBS_FILE
  echo "        --station-noise-params \\" >> $PBS_FILE
  echo "        --no-uncertainty \\" >> $PBS_FILE
  echo "        -vv &> /scratch/ehetland_flux/hinest/"$NAME".log" >> $PBS_FILE

  NAME=strain-south-$yr-$yrp2
  PBS_FILE=pbs/$NAME.sh
  DATA_FILE=data/south/$yr-$yrp2/data.h5
  # write a pbs script for it
  echo "#!/bin/bash" > $PBS_FILE
  echo "#PBS -A ehetland_flux" >> $PBS_FILE
  echo "#PBS -M hinest@umich.edu" >> $PBS_FILE
  echo "#PBS -N "$NAME >> $PBS_FILE
  echo "#PBS -m abe" >> $PBS_FILE
  echo "#PBS -V" >> $PBS_FILE
  echo "#PBS -j oe" >> $PBS_FILE
  echo "#PBS -o log/"$NAME".log" >> $PBS_FILE
  echo "#PBS -q flux" >> $PBS_FILE
  echo "#PBS -l qos=flux" >> $PBS_FILE
  echo "#PBS -l nodes=1:ppn=8,mem=32000mb,walltime=40:00:00" >> $PBS_FILE
  echo "cd \$PBS_O_WORKDIR" >> $PBS_FILE
  echo "pygeons strain "$DATA_FILE" \\" >> $PBS_FILE
  echo "        --network-prior-model spwen12-se \\" >> $PBS_FILE
  echo "        --network-prior-params 1.0 0.1 100.0 \\" >> $PBS_FILE
  echo "        --station-noise-model p0 p1 per \\" >> $PBS_FILE
  echo "        --station-noise-params \\" >> $PBS_FILE
  echo "        --no-uncertainty \\" >> $PBS_FILE
  echo "        -vv &> /scratch/ehetland_flux/hinest/"$NAME".log" >> $PBS_FILE

  done
