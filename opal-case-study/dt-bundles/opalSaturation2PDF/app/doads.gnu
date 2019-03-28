set term pdf enhanced
#set term postscript enh 'Helvetica' 25
#set term png
set output 'saturationPlot.pdf'
#set output outfile
#set output 'doad.png'
set style line 1 lt 1 lw 2
set style line 2 lt 2 lw 2
set style line 3 lt 3 lw 2

set title 'Opal Simulation: Fe-Cu-Ni-Mn'

set xlabel 'Time t / s '
set ylabel 'Function {/Symbol x}(t) '
set xrange [xmin:xmax]
set yrange [ymin:ymax]
set grid
set key bottom right
#set logscale y
set logscale x
#set format x '%e'
#set format x '%.1t*10^{%T}'
set format x '10^{%T}'

#a1=0.613977
tau1=188.256
f1(x)=1.0-exp(-(x/tau1)**(a1))
FIT_LIMIT=1.0e-12
fit [0:1e10] f1(x) doad using 2:4 via tau1,a1

plot doad using 2:4 title 'Simulation Fe-Cu-Ni-Mn', f1(x)

#plot 'doad354.dat' using 3:4 title 'Simulation Fe-Cu-Ni-Mn' with points pt 4, '#doad408.dat' using 2:4, f2(x) , f2(x)title 'JMA-Gesetz: {/Symbol x}(t)=1-exp[-(#t/{/Symbol t})^{n}]' ls 1

#set term x11
#set out
#replot
#pause -1






