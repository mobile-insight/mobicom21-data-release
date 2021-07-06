reset

set output  "rrc_setup_latency-v2.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 1, 0.6
set 


# set ylabel "Suspension (s)" offset 2, 0
# set ylabel "Dataset (GB)" offset 1.7, 0
set ylabel "Latency (ms)" offset 1.7, 0
set yrange [0:90]
set ytics 0,30,90
# set ytics ("0" 0, "20M" 20, "40M" 40)

# set xrange [-0.5:6.5]
# set xtics("2019/04" 0, "2019/05" 1, "2019/06" 2, "2019/07" 3, "2019/08" 4, "2019/09" 5, "PHY" 6)
# set xtics rotate by 45 offset -1, -1.3
set xtics font ",28" rotate by 45 offset -1, -1.3


set border lw 3

unset key

set style data histogram
set style histogram cluster gap 1
#set style fill solid border -1
# set samples 11
set style fill solid 0.5 pattern border
# set style fill solid 0.5 border
set boxwidth 0.75 relative


plot "./RRC_setup.txt" using ($2):xticlabel(1) lw 4 lt -1 fc rgb "#000000" 
