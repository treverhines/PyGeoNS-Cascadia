#!/bin/bash

mkdir -p sse

# Catalog of large SSEs
 
# 2009a
# lat : 43.5 - 47.5
# date : 2009-07-01 - 2009-11-01
mkdir -p sse/2009a
pygeons crop data.final.h5 \
        --start-date 2009-07-01 \
        --stop-date 2009-11-01 \
        --min-lat 43.5 \
        --max-lat 47.5 \
        --max-lon -120.0 \
        --output-stem sse/2009a/data \
        -vv

# 2010a
# lat : 45.5 - 51.0
# date : 2010-07-01 - 2010-11-01
mkdir -p sse/2010a
pygeons crop data.final.h5 \
        --start-date 2010-07-01 \
        --stop-date 2010-11-01 \
        --min-lat 45.5 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2010a/data \
        -vv

# 2011a
# lat : 43.5 - 47.5
# date : 2011-05-01 - 2011-09-01
mkdir -p sse/2011a
pygeons crop data.final.h5 \
        --start-date 2011-05-01 \
        --stop-date 2011-09-01 \
        --min-lat 43.5 \
        --max-lat 47.5 \
        --max-lon -120.0 \
        --output-stem sse/2011a/data \
        -vv

# 2011b
# lat : 45.5 - 51.0
# date : 2011-07-01 - 2011-11-01
mkdir -p sse/2011b
pygeons crop data.final.h5 \
        --start-date 2011-07-01 \
        --stop-date 2011-11-01 \
        --min-lat 45.5 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2011b/data \
        -vv

# 2012a
# lat : 45.5 - 51.0
# date : 2012-08-01 - 2012-12-01
mkdir -p sse/2012a
pygeons crop data.final.h5 \
        --start-date 2012-08-01 \
        --stop-date 2012-12-01 \
        --min-lat 45.5 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2012a/data \
        -vv

# 2013a
# lat : 43.5 - 47.5
# date : 2013-02-01 - 2013-06-01
mkdir -p sse/2013a
pygeons crop data.final.h5 \
        --start-date 2013-02-01 \
        --stop-date 2013-06-01 \
        --min-lat 43.5 \
        --max-lat 47.5 \
        --max-lon -120.0 \
        --output-stem sse/2013a/data \
        -vv

# 2013b
# lat : 45.5 - 51.0
# date : 2013-08-01 - 2013-12-01
mkdir -p sse/2013b
pygeons crop data.final.h5 \
        --start-date 2013-08-01 \
        --stop-date 2013-12-01 \
        --min-lat 45.5 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2013b/data \
        -vv

# 2014a
# lat : 45.5 - 51.0
# date : 2014-10-01 - 2015-02-01
mkdir -p sse/2014a
pygeons crop data.final.h5 \
        --start-date 2014-10-01 \
        --stop-date 2015-02-01 \
        --min-lat 45.5 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2014a/data \
        -vv

# 2015a
# lat : 45.5 - 51.0
# date : 2015-11-01 - 2016-03-01
mkdir -p sse/2015a
pygeons crop data.final.h5 \
        --start-date 2015-11-01 \
        --stop-date 2016-03-01 \
        --min-lat 45.5 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2015a/data \
        -vv

# 2016a
# lat : 43.5 - 47.5
# date : 2015-12-01 - 2016-04-01
mkdir -p sse/2016a
pygeons crop data.final.h5 \
        --start-date 2015-12-01 \
        --stop-date 2016-04-01 \
        --min-lat 43.5 \
        --max-lat 47.5 \
        --max-lon -120.0 \
        --output-stem sse/2016a/data \
        -vv

# 2017a
# lat : 45.5 - 51.0
# date : 2017-01-01 - 2017-05-01
mkdir -p sse/2017a
pygeons crop data.final.h5 \
        --start-date 2017-01-01 \
        --stop-date 2017-05-01 \
        --min-lat 45.5 \
        --max-lat 51.0 \
        --max-lon -120.0 \
        --output-stem sse/2017a/data \
        -vv

# null (no signal present)
# lat : 43.5 - 47.5
# date : 2015-01-01 - 2015-05-01
mkdir -p sse/null
pygeons crop data.final.h5 \
        --start-date 2015-01-01 \
        --stop-date 2015-05-01 \
        --min-lat 43.5 \
        --max-lat 47.5 \
        --max-lon -120.0 \
        --output-stem sse/null/data \
        -vv

