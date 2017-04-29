#!/bin/bash
pygeons info data.clean.merged.crop.h5 -vv

pygeons reml data.clean.merged.crop.h5 \
        --network-model exp-p0 \
        --network-params 1.0 0.1 \
        --station-model p0 p1 per fogm \
        --station-params east      0.5 0.1 \
                         north     0.5 0.1 \
                         vertical 10.0 1.0 \
        --station-fix 0 1 \
        -vv
