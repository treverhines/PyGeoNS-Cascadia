#!/bin/bash
# this script cleans data in the south-east section of the Pacific
# Northwest

FILE="data-2017-04-26.h5"
MIN_LON="-121.0"
MAX_LAT="42.0"
MIN_LAT="40.0"

mkdir -p work/section-2/2016-2017
mkdir -p work/section-2/2015-2016
mkdir -p work/section-2/2014-2015
mkdir -p work/section-2/2013-2014
mkdir -p work/section-2/2012-2013
mkdir -p work/section-2/2011-2012
mkdir -p work/section-2/2010-2011

pygeons clean $FILE \
        --input-edits-file manual-edits.txt \
        --output-stem work/section-2/data \
        --no-display \
        -vv

for i in `seq 0 1 6`
  do
  ip1=$((i+1))
  pygeons crop work/section-2/data.h5 \
          --max-lat $MAX_LAT \
          --min-lat $MIN_LAT \
          --min-lon $MIN_LON \
          --start-date 201$i-01-01 \
          --stop-date 201$ip1-01-01 \
          --output-stem work/section-2/201$i-201$ip1/data \
          -vv
  pygeons autoclean work/section-2/201$i-201$ip1/data.h5 \
          --output-stem work/section-2/201$i-201$ip1/data.clean \
          -vv
  done

pygeons merge work/section-2/2010-2011/data.clean.h5 \
              work/section-2/2011-2012/data.clean.h5 \
              work/section-2/2012-2013/data.clean.h5 \
              work/section-2/2013-2014/data.clean.h5 \
              work/section-2/2014-2015/data.clean.h5 \
              work/section-2/2015-2016/data.clean.h5 \
              work/section-2/2016-2017/data.clean.h5 \
        --output-stem work/section-2/data.clean.merged \
        -vv
