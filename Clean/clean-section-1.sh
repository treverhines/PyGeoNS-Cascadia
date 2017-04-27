#!/bin/bash
# this script cleans data in the north-east section of the Pacific
# Northwest

FILE="data-2017-04-26.h5"
MIN_LON="-121.0"
MIN_LAT="42.0"

mkdir -p work/section-1/2016-2017
mkdir -p work/section-1/2015-2016
mkdir -p work/section-1/2014-2015
mkdir -p work/section-1/2013-2014
mkdir -p work/section-1/2012-2013
mkdir -p work/section-1/2011-2012
mkdir -p work/section-1/2010-2011

pygeons clean $FILE \
        --input-edits-file manual-edits.txt \
        --output-stem work/section-1/data \
        --no-display \
        -vv

for i in `seq 0 1 6`
  do
  ip1=$((i+1))
  pygeons crop work/section-1/data.h5 \
          --min-lat $MIN_LAT \
          --min-lon $MIN_LON \
          --start-date 201$i-01-01 \
          --stop-date 201$ip1-01-01 \
          --output-stem work/section-1/201$i-201$ip1/data \
          -vv
  pygeons autoclean work/section-1/201$i-201$ip1/data.h5 \
          --output-stem work/section-1/201$i-201$ip1/data.clean \
          -vv
  done

pygeons merge work/section-1/2010-2011/data.clean.h5 \
              work/section-1/2011-2012/data.clean.h5 \
              work/section-1/2012-2013/data.clean.h5 \
              work/section-1/2013-2014/data.clean.h5 \
              work/section-1/2014-2015/data.clean.h5 \
              work/section-1/2015-2016/data.clean.h5 \
              work/section-1/2016-2017/data.clean.h5 \
        --output-stem work/section-1/data.clean.merged \
        -vv
