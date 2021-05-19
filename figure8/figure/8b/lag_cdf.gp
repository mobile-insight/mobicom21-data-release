reset

set output  "lag_cdf.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 0.75, 0.95
set tmargin 0.4
set bmargin 2
set lmargin -0.05
set rmargin 1.5

set ylabel "CDF (%)" offset 1.7, 0
set yrange [35:100]
set ytics 0,20,100

set xlabel "Per-message lag (ms)" offset 0, 1
set xrange [0:8]
set xtics 0,2,8
set xtics offset 0, 0.5

set border lw 3
set style data linespoints
# set style line 1 lt 2 lw 2 pt 3 ps 0.5


#set style linespoints
#set style function lines

set style line 1 lw 8 lt 1 pt 1 ps 1 lc rgb "blue"
set style line 2 lw 8 lt 9 lc rgb '#31f120' ps 2 pt 12 pi 3
set style line 3 lw 8 lt 6 lc rgb '#0044a5' ps 2 pt 9 pi 5
set style line 4 lw 8 lt 7 lc rgb '#888888' ps 2 pt 7 pi 4


set key bottom right

plot "cdf_pixel_1.txt" using 1:($2*100) with l lt 4 lw 12 lc rgb '#7fbf7b'  title "Pixel-1", \
"cdf_pixel_3.txt" using 1:($2*100) with l lt 'dashed' lw 20 lc "blue" title "Pixel-3", \
"cdf_z3.txt" using 1:($2*100) with p lt 9 lw 8 lc "red"   title "Moto-Z3"









