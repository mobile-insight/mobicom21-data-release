reset

set output  "bat_bar.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 2, 0.6

set lmargin 8
set rmargin 0.1
set tmargin 0.1

# set ylabel "Suspension (s)" offset 2, 0
# set ylabel "Dataset (GB)" offset 1.7, 0
set ylabel "Battery cost\n (%/min)" offset 1, -0.5
set yrange [0:2.2]
set ytics 0,0.5,2
# set ytics ("0" 0, "20M" 20, "40M" 40)

# set xrange [-0.5:6.5]
# set xtics("2019/04" 0, "2019/05" 1, "2019/06" 2, "2019/07" 3, "2019/08" 4, "2019/09" 5, "PHY" 6)
# set xtics rotate by 45 offset -1, -1.3
# set xtics font ",28" rotate by 45 offset -1, -1.3
# set xtics font ",35"
set xlabel "Sampling ratio" offset 0,0.5

set border lw 3

unset key

set style data histogram
set style histogram cluster gap 1 errorbars
#set style fill solid border -1
# set samples 11
# set style fill solid 0.5 pattern border
# set style fill solid 0.5 border
set boxwidth 1 relative


#plot "./bat_bar.txt" using ($2):xticlabel(1) lw 6 lt -1 fc rgb "#000000"
plot "./bat_bar.txt" using 2:3:4:xtic(1) lw 6 lt -1 fc rgb "#000000"