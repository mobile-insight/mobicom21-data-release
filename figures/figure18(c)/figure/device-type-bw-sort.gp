reset

set output  "device-type-bw-sort.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",64"

set size 4, 1.5


# set ylabel "Max Available BW (MHz)" offset 1, -1 font ",50"
set ylabel "Max runtime BW (MHz)" offset 1, -1.8 font ",64"
set yrange [0:85]
set ytics 0,20,80 font ",64"

set xtics right font ",64" rotate by 45 offset 0.5, 0.3


set border lw 3
set tmargin 0.2
set bmargin 5
set lmargin 6.8
set rmargin 0

set style data histogram
set boxwidth 0.75 relative



# set key horizontal samplen 5 at 9,1.5
# set key horizontal samplen 0.4 at 11,95
# set key horizontal  at 5.5, 130
# set key maxrows 1
set style fill pattern border
set style histogram gap 1
unset key

plot "./device-type-bw-sort.txt" using ($3):xticlabel(1) lw 5 lt -1