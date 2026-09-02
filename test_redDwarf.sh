#!/bin/bash
source ~/miniconda3/etc/profile.d/conda.sh
conda activate dSph-dark-matter
export PFILES=$HOME/.ctools
set -e


TARGET_RA=15.84
TARGET_DEC=62.37
RADIUS=30.0
ARCHIVE="/home/joshua-h/comptel_archive"
DBDIR="/home/joshua-h/comptel_db"
SELECTED="test_vp_selected.xml"
BINNED="test_vp_binned.xml"
COMBINED="test_vp_combined.xml"
MODEL="test_model.xml"

echo "Data Base"
comgendb \
    archive=$ARCHIVE \
    dbase=$DBDIR \
    download=no

echo "Selecting"
comobsselect \
    dbase=$DBDIR/dbase.fits \
    outobs=$SELECTED \
    pntselect=CIRCLE \
    coordsys=CEL \
    ra=$TARGET_RA \
    dec=$TARGET_DEC \
    rad=$RADIUS \
    tmin=NONE \
    tmax=NONE

echo "Binning"
comobsbin \
    inobs=$SELECTED \
    outobs=$BINNED \
    outfolder=/home/joshua-h/comptel_data \
    response=MODEL \
    ebinalg=LOG \
    emin=0.75 \
    emax=30.0 \
    phase=NONE \
    phase0=51544.5 \
    period=1.0 \
    enumbins=16 \
    coordsys=CEL \
    proj=TAN \
    nchi=80 \
    npsi=80 \
    dchi=1.0 \
    dpsi=1.0 \
    nphibar=25 \
    dphibar=2.0

echo "Adding"
comobsadd \
    inobs=$BINNED \
    inmodel=NONE \
    outobs=$COMBINED \
    coordsys=CEL \
    proj=TAN \
    ra=$TARGET_RA \
    dec=$TARGET_DEC \
    nchi=80 \
    npsi=80 \
    dchi=1.0 \
    dpsi=1.0

echo "Modeling"
comobsmodel \
    inobs=$COMBINED \
    outmodel=$MODEL \
    ra=$TARGET_RA \
    dec=$TARGET_DEC \
    srcname="V388Cas" \
    brems=NONE \
    ic=NONE \
    iso=NONE \
    diffusetype=BINS \
    bkgtype=BINS

echo "csspec"
csspec \
    inobs=$COMBINED \
    inmodel=$MODEL \
    srcname="V388Cas" \
    expcube=NONE \
    psfcube=NONE \
    edispcube=NONE \
    bkgcube=NONE \
    caldb=NONE \
    irf=NONE \
    outfile="test_spectrum.fits" \
    method=BINS \
    ebinalg=LOG \
    emin=0.75 \
    emax=30.0 \
    enumbins=16