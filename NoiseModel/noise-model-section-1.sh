#!/bin/bash
FILE="data.clean.h5"
MIN_LON="-121.0"
MIN_LAT="42.0"
MAX_LAT="60.0"

mkdir -p work/section-1/2015-2017
#mkdir -p work/section-1/2015-2016
#mkdir -p work/section-1/2014-2015
#mkdir -p work/section-1/2013-2014
#mkdir -p work/section-1/2012-2013
#mkdir -p work/section-1/2011-2012
#mkdir -p work/section-1/2010-2011

pygeons crop $FILE \
        --min-lon $MIN_LON \
        --min-lat $MIN_LAT \
        --max-lat $MAX_LAT \
        --start-date 2015-01-01 \
        --stop-date 2017-01-01 \
        --output-stem work/section-1/2015-2017/data \
        -vv

pygeons reml work/section-1/2015-2017/data.h5 \
        --network-model p10 p11 per-se \
        --network-params 1.0 50.0  \
        --network-fix \
        --station-model p0 per fogm \
        --station-params 0.5 0.01 \
        --station-fix 0 1 \
        -vv
