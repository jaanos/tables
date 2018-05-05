#!/bin/bash

wget -N -r --no-parent http://www.win.tue.nl/~aeb/graphs/
wget -N -r --no-parent http://www.win.tue.nl/~aeb/drg/drgtables.html
git add www.win.tue.nl
git commit -m "Update $(date "+%Y-%m-%d")" --author "Andries E. Brouwer <aeb@cwi.nl>"

wget -N -r --no-parent http://www.uwyo.edu/jwilliford/data/qprim3_table.html
wget -N -r --no-parent http://www.uwyo.edu/jwilliford/data/qbip4_table.html
wget -N -r --no-parent http://www.uwyo.edu/jwilliford/data/qbip5_table.html
git add www.uwyo.edu
git commit -m "Update $(date "+%Y-%m-%d")" --author "Jason S. Williford <jwillif1@uwyo.edu>"

git push
