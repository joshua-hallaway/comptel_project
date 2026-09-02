#!/bin/bash
mkdir -p "/home/joshua-h/comptel_archive"

for phase in phase01 phase02 phase03 phase04 phase05 phase06 phase07 phase08
do
    mkdir -p "/home/joshua-h/comptel_archive/$phase"
    wget -e robots=off -r -l0 -np -nv -N -P "/home/joshua-h/comptel_archive/$phase" "https://heasarc.gsfc.nasa.gov/FTP/compton/data/comptel/$phase/"
done