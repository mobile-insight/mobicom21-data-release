reset

set output  "energy.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 2, 0.7
set tmargin 0.4
set bmargin 1.5
set lmargin -0.2
set rmargin 1.2

set ylabel "Battery (%)" offset 1.7, 0
set yrange [75:100]
set ytics 80,10,100

# set grid ytics lc rgb "#bbbbbb" lw 2 lt 2


set xlabel "Time (min)" offset 1.7, 1.5
set xrange [0:60]
set xtics 0,20,60
set xtics offset 0, 0.5

set border lw 3
# set style data linespoints
# set style line 1 lt 2 lw 2 pt 3 ps 0.5


set style function linespoints

set style line 1 lt -1 lw 8 lc rgb '#7fbf7b' dt 1 ps 2 pt 7 pi 5
set style line 2 lt -1 lw 8 lc rgb '#0571b0' dt 1 ps 2 pt 12 pi 5
set style line 3 lt -1 lw 8 lc rgb '#ca0020' dt 1 ps 3 pt 9 pi 5
set style line 4 lt -1 lw 8 lc rgb "orange" dt 3 ps 2 pt 2 pi 5

set key horiz at 48, 84
set key maxrows 2 width -18
#set key maxrows 2 width -7
#set key font ",30"


# plot "lag_time_sorted.txt" using ($1):($2) notitle with lp lw 1 lc rgb "black" ps 1.5 

plot "./energy_gp.txt" using 1:2 w lp ls 1 title "No MobileInsight (screen on)", \
"" using 1:3 w lp ls 2 title "Collection only", \
"" using 1:4 w lp ls 3 title "W/ parsing", \
"" using 1:5 w lp ls 4 title "W/ analysis", \

# plot "./energy_gp.txt" using 1:3 with l lw 4 lc rgb '#0571b0' title "Collection only", \
# "" using 1:4 lw 4 lc "blue" title "W/ parsing", \
# "" using 1:5 lw 4 lc rgb '#ca0020' title "W/ analysis", \
# "" using 1:2 lw 4 lc rgb '#c2a5cf' title "No MobileInsight (screen on)", \


