#!/bin/bash
source ~/miniconda3/etc/profile.d/conda.sh
conda activate dSph-dark-matter
set -e

TARGET_RA=15.84
TARGET_DEC=62.37
RADIUS=4.0
ARCHIVE="/home/joshua-h/comptel_archive"
DBDIR="/home/joshua-h/comptel_db"
SELECTED="test_vp_selected.xml"
BINNED="test_vp_binned.xml"
COMBINED="test_vp_combined.xml"
MODEL="test_model.xml"

comgendb archive=$ARCHIVE dbase=$DBDIR download=yes

comobsselect dbase=$DBDIR/dbase.fits outobs=$SELECTED pntselect=CIRCLE coordsys=CEL ra=$TARGET_RA dec=$TARGET_DEC rad=$RADIUS

comobsbin inobs=$SELECTED outobs=$BINNED response=MODEL ebinalg=LOG emin=0.75 emax=30.0 enumbins=10

comobsadd inobs=$BINNED outobs=$COMBINED

comobsmodel inobs=$COMBINED outmodel=$MODEL ra=$TARGET_RA dec=$TARGET_DEC srcname="RedDwarfTest"

csspec inobs=$COMBINED inmodel=$MODEL srcname="RedDwarfTest" outfile="test_spectrum.fits" ebinalg=LOG emin=0.75 emax=30.0 enumbins=10 calc_ts=yes calc_ulim=yes