#!/bin/bash

wget -N -r --no-parent http://www.win.tue.nl/~aeb/graphs/
wget -N -r --no-parent http://www.win.tue.nl/~aeb/drg/drgtables.html
git add www.win.tue.nl
git commit -m "Update $(date "+%Y-%m-%d")" --author "Andries E. Brouwer <aeb@cwi.nl>"
git push
