reset

set output  "ca-location-v2.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 1, 0.6
set tmargin 0.5
set rmargin 0.25
set lmargin -0.05


set ylabel "Cells w/ CA (%)" offset 2, -0.5
set yrange [0:100]
set ytics 0,20,100

set xtics font ",28" rotate by 25 offset -2, -1


set border lw 3
#set tmargin 2.5

set style data histogram
set boxwidth 0.75 relative

# set key horizontal samplen 5 at 9,1.5
# set key horizontal samplen 0.4 at 11,95
set key horizontal top right samplen 0.5
set key maxrows 1
set style fill pattern border
set style histogram gap 1



plot "./results.txt" using ($2*100):xticlabel(1) lw 4 lt -1   title "LA", \
"" using ($3*100) lw 4 lt -1  title "WL"