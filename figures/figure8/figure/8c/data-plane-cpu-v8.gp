# reset

set output  "data-plane-cpu-v8.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 1, 0.95

set multiplot layout 2, 1
#set tmargin 1
# set bmargin at screen 0.23

set size 1, 0.35
set lmargin at screen 0.25
set rmargin at screen 0.99
set bmargin at screen 0.5
set tmargin at screen 0.85

# set key at graph 0 ,screen 1 left center
#set key vertical samplen 1 at 2.8, 20000
#set key out horiz
#set key left top
set key width -4 samplen 1.5 vertical maxrows 1 at 2.9,1500
#set key horiz samplen 1 at -0.5, 2000
#set key maxrows 1
#set key font ",38"

# set xtics rotate by 45 offset -3, -2.2

set style fill pattern border
# set ylabel "Single-core CPU (%)" offset 1.5, 0
set ylabel "CPU in one \n core (%)" offset 1.5, 0
set yrange [0.01:105]
set logscale y 10
set ytics 0.1,10,100
set ytics font ", 30"


# set xtics rotate by 45

set border lw 3

set style data histogram
# set style histogram rowstacked gap 3
set style histogram cluster gap 1
#set style fill solid 0.5 pattern border
set boxwidth 0.75 relative
unset xtics

plot "./data-plane-cpu-single.txt" using ($2) lw 4 lt -1 fc rgb "#000000" fs pattern 1 title "Collection", \
"" using ($3) lw 4 lt -1 fc rgb "#000000" fs pattern 0 title "Parsing", \
"" using ($4):xticlabel(1) lw 4 lt -1 fc rgb "#000000" fs pattern 2 title "Analysis", \

unset key
set xtics offset 0,0.5
set size 1, 0.35
set lmargin at screen 0.25
set rmargin at screen 0.99
set bmargin at screen 0.1
set tmargin at screen 0.45

# set ylabel "Multi-core CPU (%)" offset 1.5, 0
set ylabel "CPU among \n all cores (%)" offset 1.5, 0
# set yrange [0:31.5]
set ytics 0.1,10,100
set style fill pattern border
plot "./data-plane-cpu-multi.txt" using ($2) lw 4 lt -1 fc rgb "#000000" fs pattern 1 title "Collection", \
"" using ($3) lw 4 lt -1 fc rgb "#000000" fs pattern 0 title "Parsing", \
"" using ($4):xticlabel(1) lw 4 lt -1 fc rgb "#000000" fs pattern 2 title "Analysis", \