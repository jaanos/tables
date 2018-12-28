#!/bin/bash

wget -N -r --no-parent http://www.win.tue.nl/~aeb/graphs/
wget -N -r --no-parent http://www.win.tue.nl/~aeb/drg/drgtables.html
git add www.win.tue.nl
git commit -m "Update $(date "+%Y-%m-%d")" --author "Andries E. Brouwer <aeb@cwi.nl>"

wget -N -r --no-parent http://www.uwyo.edu/jwilliford/files/data/qprim3table.html
wget -N -r --no-parent http://www.uwyo.edu/jwilliford/files/data/tableqbip4.html
wget -N -r --no-parent http://www.uwyo.edu/jwilliford/files/data/tableqbip5.html
sed -r -i -e "s/\r//" qpoly/qprim3table.html
sed -r -i -e "s/\r//" qpoly/tableqbip4.html
sed -r -i -e "s/\r//" qpoly/tableqbip5.html
git add www.uwyo.edu
git commit -m "Update $(date "+%Y-%m-%d")" --author "Jason S. Williford <jwillif1@uwyo.edu>"

wget -N -r --no-parent http://ericmoorhouse.org/pub/planes/
wget -N -r --no-parent http://ericmoorhouse.org/pub/planes16/
wget -N -r --no-parent http://ericmoorhouse.org/pub/planes25/
wget -N -r --no-parent http://ericmoorhouse.org/pub/planes27/
wget -N -r --no-parent http://ericmoorhouse.org/pub/planes32/
wget -N -r --no-parent http://ericmoorhouse.org/pub/planes49/
wget -N -r --no-parent http://ericmoorhouse.org/pub/genpoly/
ls ericmoorhouse.org/pub/planes49/plane/*.* | sed -r "s|^(.*)\..*|\0 \1/index.html|" | xargs -n 2 mv
mv "ericmoorhouse.org/pub/planes49/nsrvpz.asp?filename=%5Csample.txt" ericmoorhouse.org/pub/planes49/nsrvpz.asp
git add ericmoorhouse.org
git commit -m "Update $(date "+%Y-%m-%d")" --author "G. Eric Moorhouse <moorhous@uwyo.edu>"

git push
