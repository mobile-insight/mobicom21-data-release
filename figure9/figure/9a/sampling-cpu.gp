reset

set output  "sampling-cpu.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",64"

set size 1.3, 1


set ylabel "CPU in \none core (%)" offset 2.2, -0.1 font ",72"
set yrange [0:100]
set ytics 0,50,100

set border lw 3

set style data histogram
set style histogram cluster gap 1
#set style fill solid border -1
# set samples 11
set style fill solid 0.5 pattern border
# set style fill solid 0.5 border
set boxwidth 1 relative

unset key
set style fill pattern border

set xlabel "Sampling ratio (%)" offset 0, 0.5 font ",72"

plot "./sampling-cpu.txt" using ($2):xticlabel(1) lw 4 lt -1 fc rgb "#000000"
