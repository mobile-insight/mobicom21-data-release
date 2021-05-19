reset

set output  "lag_vstime.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 2, 0.7
set tmargin 0.4
set bmargin 2
set lmargin -1
set rmargin 1

set ylabel "Lag (ms)" offset 1.7, 0
set yrange [0:10]
set ytics 0,5,10

# set grid ytics lc rgb "#bbbbbb" lw 2 lt 2


set xlabel "Time (second)" offset 1.7, 1
set xrange [0:15]
set xtics 0,2,15
set xtics offset 0, 0.5

set border lw 3
# set style data linespoints
# set style line 1 lt 2 lw 2 pt 3 ps 0.5


set style function linespoints

set style line 1 lw 8 pt 1 ps 1 lc rgb "blue"
set style line 2 lw 3 lc rgb '#31f120' ps 2 pt 12 pi 3
set style line 3 lw 3 lc rgb '#0044a5' ps 2 pt 9 pi 5
set style line 4 lw 4 lc rgb '#888888' ps 2 pt 7 pi 4

set key bottom right
set key horiz

plot "lag_time_sorted.txt" using ($1):($2) notitle with lp lw 1 lc rgb "black" ps 1.5 
#pt "."



