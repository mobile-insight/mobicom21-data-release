reset

set output  "msg_trace-v2.eps"
#set terminal postscript eps enh rounded color dashed dl 4 font ",40"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 2, 0.7
set tmargin 0.3
set bmargin 2
set lmargin -1
set rmargin 1

#set size 2, 0.8
#set tmargin .1
#set bmargin 1.5
#set lmargin -0.1
#set rmargin 0


# set ylabel "Suspension (s)" offset 2, 0
# set ylabel "Dataset (GB)" offset 1.7, 0
set xlabel "Time (second)" offset 0, 1
set ylabel "Message/s" offset 1.7, 0
set yrange [0:1700]
set ytics 0,500,1700
set grid ytics lc rgb "#bbbbbb" lw 2 lt 2


set xrange [0:500]
set xtics 0,100,400
set xtics offset 0, 0.5


# set xtics rotate by 45 offset -1, -1.3
# set xtics font ",28" rotate by 45 offset -1, -1.3


set border lw 3


#set style data histogram
#set style histogram cluster gap 1
set style fill solid border -1
# set samples 11
# set style fill solid 0.5 border
# set style fill solid 0.5 border
set boxwidth 0.75 relative

set style line 1 linetype 1 pointtype 0 linewidth 1 linecolor rgb "#7fc97f"
set style line 2 linetype 1 pointtype 0 linewidth 1 linecolor rgb "#beaed4"
set style line 3 linetype 1 pointtype 0 linewidth 1 linecolor rgb "#fdc086"
set style line 4 linetype 1 pointtype 0 linewidth 1 linecolor rgb "#ea0a8e"
set style line 5 linetype 1 pointtype 0 linewidth 1 linecolor rgb "#8B0000"
set style line 6 linetype 1 pointtype 0 linewidth 1 linecolor rgb "#ffc700"


plot \
"./result3.txt" using 1:($7+$6+$5+$4+$3+$2) title "PHY" with filledcurves x1 linestyle 1,\
"" using 1:($7+$6+$5+$4+$3) title "MAC" with filledcurves x1 linestyle 2,\
"" using 1:($7+$6+$5+$4) title "RLC" with filledcurves x1 linestyle 3,\
"" using 1:($7+$6+$5) title "PDCP" with filledcurves x1 linestyle 4,\
"" using 1:($7+$6) title "RRC" with filledcurves x1 linestyle 5,\
"" using 1:($7) title "NAS" with filledcurves x1 linestyle 6
