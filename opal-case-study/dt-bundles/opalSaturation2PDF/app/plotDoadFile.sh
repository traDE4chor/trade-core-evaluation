#!/bin/bash

# Calculate the X,Y min and max values with the corresponding python script
file=$1

if [ $# -ne 1 ]; then
    echo "Usage $0 'doadFileName.dat'"
    exit 2
else
    minMaxStringArray=$(python3 opalDoadMinMax.py ${file})

    # Parse the result from stdout "minMaxString" to the different variables
    minMaxString=${minMaxStringArray#"["}
    minMaxString=${minMaxString%"]"}
    IFS=', ' read -ra array <<< "$minMaxString"
    xminVal=${array[0]}
    xmaxVal=${array[1]}
    yminVal=${array[2]}
    ymaxVal=${array[3]}

    echo 'Invoking gnuplot with xmin='${xminVal}', xmax='${xmaxVal}', ymin='${yminVal}' and ymax='${ymaxVal}

    # Call gnuplot with corresponding parameters
    gnuplot -e "xmin=${xminVal};xmax=${xmaxVal};ymin=${yminVal};ymax=${ymaxVal};doad='${file}';outfile='doad.ps'" doads.gnu
fi
