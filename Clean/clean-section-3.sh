#!/bin/bash
# this script cleans data in the north-west section of the Pacific
# Northwest

FILE="data-2017-04-26.h5"
MAX_LON="-121.0"
MIN_LAT="47.0"

rm -rf work/section-3
mkdir -p work/section-3/2016-2017
mkdir -p work/section-3/2015-2016
mkdir -p work/section-3/2014-2015
mkdir -p work/section-3/2013-2014
mkdir -p work/section-3/2012-2013
mkdir -p work/section-3/2011-2012
mkdir -p work/section-3/2010-2011

pygeons clean $FILE \
        --input-edits-file manual-edits.txt \
        --output-stem work/section-3/data \
        --no-display \
        -vv

for i in `seq 0 1 6`
  do
  ip1=$((i+1))
  pygeons crop work/section-3/data.h5 \
          --max-lon $MAX_LON \
          --min-lat $MIN_LAT \
          --start-date 201$i-01-01 \
          --stop-date 201$ip1-01-01 \
          --output-stem work/section-3/201$i-201$ip1/data \
          -vv
  #pygeons autoclean work/section-3/201$i-201$ip1/data.h5 \
  #        --output-stem work/section-3/201$i-201$ip1/data.clean \
  #        -vv
  done

#pygeons merge work/section-3/2010-2011/data.clean.h5 \
#              work/section-3/2011-2012/data.clean.h5 \
#              work/section-3/2012-2013/data.clean.h5 \
#              work/section-3/2013-2014/data.clean.h5 \
#              work/section-3/2014-2015/data.clean.h5 \
#              work/section-3/2015-2016/data.clean.h5 \
#              work/section-3/2016-2017/data.clean.h5 \
#        --output-stem work/section-3/data.clean.merged \
#        -vv
