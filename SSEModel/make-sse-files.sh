#!/bin/bash

mkdir -p sse

# Catalog of large SSEs
 
# 2010a
# lat : 45.0 - 50.0
# date : 2010-07-01 - 2010-10-01
mkdir -p sse/2010a
pygeons crop data.final.h5 \
        --start-date 2010-07-01 \
        --stop-date 2010-10-01 \
        --min-lat 45.0 \
        --max-lat 50.0 \
        --max-lon -120.0 \
        --output-stem sse/2010a/data \
        -vv

# 2011a
# lat : 43.5 - 47.0
# date : 2011-05-01 - 2011-08-01
mkdir -p sse/2011a
pygeons crop data.final.h5 \
        --start-date 2011-05-01 \
        --stop-date 2011-08-01 \
        --min-lat 43.5 \
        --max-lat 47.0 \
        --max-lon -120.0 \
        --output-stem sse/2011a/data \
        -vv

# 2011b
# lat : 45.5 - 50.0
# date : 2011-07-01 - 2011-10-01
mkdir -p sse/2011b
pygeons crop data.final.h5 \
        --start-date 2011-07-01 \
        --stop-date 2011-10-01 \
        --min-lat 45.5 \
        --max-lat 50.0 \
        --max-lon -120.0 \
        --output-stem sse/2011b/data \
        -vv

# 2012a
# lat : 46.0 - 51.0
# date : 2012-08-01 - 2012-11-01
mkdir -p sse/2012a
pygeons crop data.final.h5 \
        --start-date 2012-08-01 \
        --stop-date 2012-11-01 \
        --min-lat 46.0 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2012a/data \
        -vv

# 2013a
# lat : 43.5 - 48.0
# date : 2013-02-01 - 2013-06-01
mkdir -p sse/2013a
pygeons crop data.final.h5 \
        --start-date 2013-02-01 \
        --stop-date 2013-06-01 \
        --min-lat 43.5 \
        --max-lat 48.0 \
        --max-lon -120.0 \
        --output-stem sse/2013a/data \
        -vv

# 2013b
# lat : 46.5 - 51.0
# date : 2013-07-01 - 2013-11-01
mkdir -p sse/2013b
pygeons crop data.final.h5 \
        --start-date 2013-07-01 \
        --stop-date 2013-11-01 \
        --min-lat 46.5 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2013b/data \
        -vv

# 2014a
# lat : 46.5 - 50.0 
# date : 2014-10-01 - 2015-01-01
mkdir -p sse/2014a
pygeons crop data.final.h5 \
        --start-date 2014-10-01 \
        --stop-date 2015-01-01 \
        --min-lat 46.5 \
        --max-lat 50.0 \
        --max-lon -120.0 \
        --output-stem sse/2014a/data \
        -vv

# 2015a
# lat : 46.0 - 51.0
# date : 2015-11-01 - 2016-03-01
mkdir -p sse/2015a
pygeons crop data.final.h5 \
        --start-date 2015-11-01 \
        --stop-date 2016-03-01 \
        --min-lat 46.0 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2015a/data \
        -vv

# 2016a
# lat : 43.0 - 47.0
# date : 2015-12-01 - 2016-04-01
mkdir -p sse/2016a
pygeons crop data.final.h5 \
        --start-date 2015-12-01 \
        --stop-date 2016-04-01 \
        --min-lat 43.0 \
        --max-lat 47.0 \
        --max-lon -120.0 \
        --output-stem sse/2016a/data \
        -vv
