TIME_STD='10.0' # mm
TIME_CLS='0.06' # yr
SPACE_STD='100.0' # mm/yr
SPACE_CLS='150.0' # km
TOL="4.0"
START_DATE='2015-06-01'
STOP_DATE='2016-06-01'
DATA_FILE='data.h5'

#for TOL in 3.0 4.0
#  do
#  for TIME_CLS in 0.05 0.06 0.07
#    do
DIR="results/"$START_DATE"_to_"$STOP_DATE"/tol-"$TOL"/tcls-"$TIME_CLS"/tstd-"$TIME_STD"/scls-"$SPACE_CLS"/sstd-"$SPACE_STD
mkdir -p  $DIR
pygeons-crop $DATA_FILE --start_date $START_DATE --stop_date $STOP_DATE -o $DIR/disp.h5
pygeons-tgpr $DIR/disp.h5 $TIME_STD $TIME_CLS -t $TOL -vv --procs 4 --diff 0 -o $DIR/disp_smooth.h5
pygeons-tgpr $DIR/disp.h5 $TIME_STD $TIME_CLS -t $TOL -vv --procs 4 --diff 1 -o $DIR/vel.h5
pygeons-sgpr $DIR/vel.h5 $SPACE_STD $SPACE_CLS -t $TOL -vv --procs 4 -o $DIR/vel_smooth.h5 --diff 0 0
pygeons-sgpr $DIR/vel.h5 $SPACE_STD $SPACE_CLS -t $TOL -vv --procs 4 -o $DIR/diffx.h5 --diff 1 0
pygeons-sgpr $DIR/vel.h5 $SPACE_STD $SPACE_CLS -t $TOL -vv --procs 4 -o $DIR/diffy.h5 --diff 0 1
pygeons-sgpr $DIR/vel.h5 $SPACE_STD $SPACE_CLS -t $TOL -vv --procs 4 -o $DIR/diffx_hex.h5 --diff 1 0 -p hex.txt
pygeons-sgpr $DIR/vel.h5 $SPACE_STD $SPACE_CLS -t $TOL -vv --procs 4 -o $DIR/diffy_hex.h5 --diff 0 1 -p hex.txt
#    done
#  done

#pygeons-strain work/diffx_$TOL.h5 work/diffy_$TOL.h5 \
#               -vv \
#               --scale 2e4 \
#               --key_magnitude 1.0 \
#               --key_position 0.1 0.9 \
#               --snr_mask
#
