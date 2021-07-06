reset

set output  "ul_data_latency_stacked_monthly-v2.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 1, 0.6
set tmargin 0.5
set rmargin 0.25
set lmargin -0.05


set ylabel "Latency (ms)" offset 2, 0
set yrange [0:50]
set ytics 0,20,40

set xtics font ",28" rotate by 45 offset -1, -1.3


set border lw 3
#set tmargin 2.5

set style data histogram
set style histogram rowstacked gap 2
# set style histogram cluster gap 1
#set style fill solid border -1
# set samples 11
# set style fill solid 0.5 pattern border
# set style fill solid 0.5 border
set boxwidth 0.75 relative

# set key horizontal samplen 5 at 9,1.5
# set key horizontal samplen 0.4 at 11,95
#set key horizontal samplen 0.5 width -3
#set key font  ",34"
#at 12.5, 50
#set key maxrows 1
set key top right samplen 0.75
set style fill pattern border

# plot "./uplink_monthly_stacked.txt" using ($3):xticlabel(1) lw 4 lt -1 fc rgb "#000000" title "Waiting Latency", \
# "" using ($4) lw 4 lt -1 fc rgb "#000000" title "Transmission Latency"
plot "./uplink_monthly_stacked.txt" using ($3):xticlabel(1) lw 4 lt -1 fc rgb "#000000" title "MAC Buffering", \
"" using ($4) lw 4 lt -1 fc rgb "#000000" title "Transmission"