reset

set output  "ul_sr_config_monthly-v2.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 1, 0.6
set tmargin 1.25
set rmargin 0.25
set lmargin -0.05


set ylabel "PDF (%)" offset 2, 0
set yrange [0:101]
set ytics 0,50,100

set xtics font ",30" rotate by 45 offset -1, -1.3

set border lw 3


set style data histogram
set style histogram rowstacked gap 2
# set style histogram cluster gap 1
#set style fill solid border -1
# set samples 11
# set style fill solid 0.5 pattern border
# set style fill solid 0.5 border
set style fill pattern border
set boxwidth 0.75 relative

# set key horizontal samplen 5 at 9,1.5
set key horizontal samplen 0.5 width -0.25 at 12.5,125
#set key out top left
set key font ",32"
set key maxrows 1




# from small to larger values
plot "./sr_config_stacked_monthly.txt" using ($2*100) lw 4 lt -1 fc rgb "#000000" fs pattern 7 title "5ms", \
"" using ($3*100) lw 4 lt -1 fc rgb "#000000" fs pattern 0 title "10ms", \
"" using ($4*100) lw 4 lt -1 fc rgb "#000000" fs pattern 1 title "20ms", \
"" using ($5*100):xticlabel(1) lw 4 lt -1 fc rgb "#000000" fs pattern 3 title "40ms", \
"" using ($6*100):xticlabel(1) lw 4 lt -1 fc rgb "#000000" fs pattern 4 title "80ms"


#plot "./sr_config_stacked_monthly.txt" using ($6*100):xticlabel(1) lw 4 lt -1 fc rgb "#000000" fs pattern 4 title "80ms", \
#"" using ($5*100):xticlabel(1) lw 4 lt -1 fc rgb "#000000" fs pattern 3 title "40ms", \
#"" using ($4*100) lw 4 lt -1 fc rgb "#000000" fs pattern 1 title "20ms", \
#"" using ($3*100) lw 4 lt -1 fc rgb "#000000" fs pattern 0 title "10ms", \
#"" using ($2*100) lw 4 lt -1 fc rgb "#000000" fs pattern 2 title "5ms", \
