reset

set output  "gt-rlc-lat-v4.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

#set size 2, 0.8
#set tmargin 1.6
#set bmargin 3
#set lmargin -2

set size 2, 0.7
set tmargin 0.3
set bmargin 2
set lmargin -1.5
set rmargin 1.5


set ylabel "Latency (ms)" offset 0.2, 0
set yrange [0:90]
set ytics ("1" 1, "8" 8, "64" 64, "10" 100)

# set grid ytics lc rgb "#bbbbbb" lw 2 lt 2


set xlabel "RLC Packet Sequence Number" offset 1.7, 1
set xrange [0:100]
set xtics 0,25,100
set xtics offset 0, 0.5
set logscale y

set border lw 3
# set style data linespoints
# set style line 1 lt 2 lw 2 pt 3 ps 0.5


# set style function linespoints
set style data histogram
#set style histogram rowstacked gap 0.
set style histogram clustered gap 1
set style fill transparent solid 0.7



set key top left
set key maxrows 2


plot "results.txt" using ($3):xticlabels($1-591) title "MobileInsight Min" linecolor rgb "blue"  ,\
 "" using ($2):xticlabels($1-591) title "Ground Truth" linecolor rgb "purple",\
 "" using ($4):xticlabels($1-591) title "MobileInsight Max" linecolor rgb "red"
