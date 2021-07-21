reset

set output  "gt-control-sm.eps"
#set terminal postscript eps enh rounded color dashed dl 4 font ",36"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 2, 0.7
set tmargin 0.3
set bmargin 2
set lmargin -1.5
set rmargin 1


set ylabel "RRC State" offset 1.7, 0
set yrange [0:3.1]
set ytics("RRC-Idle" 0, "Short-DRX" 1, "Long-DRX" 2, "CRX" 3)

# set grid ytics lc rgb "#bbbbbb" lw 2 lt 2


set xlabel "Time (second)" offset 1.7, 1
set xrange [0:4]
set xtics 0,0.5,4
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


plot "results.txt" using ($2/1000):($3) title "MobileInsight" with lp lw 8 lc rgb "blue" ps 2 pt 12, \
"" using ($2/1000):($3) title "Ground Truth" with lp lw 8 ps 2 pt 9 pi 5 lc rgb "red"

# plot "results.txt" using ($2/1000):($3) title "MI" ls 1 , \
# "" using ($2/1000)+0.01:($3+0.1) title "Ground Truth" ls 2

