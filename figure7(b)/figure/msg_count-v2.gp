reset

set output  "msg_count-v2.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"

set size 2, 0.6
set tmargin 0.3
set bmargin 1
set lmargin -1
set rmargin 1


# set ylabel "Suspension (s)" offset 2, 0
# set ylabel "Msg count" offset 1.7, 0
set ylabel "Message/s" offset 1.7, 0
set yrange [0.001:1200]
set logscale y 10
set ytics (0.001, 0.1, 10, 1000)

set xrange [-0.5:6.5]
set xtics("SM" 0, "MM" 1, "RRC" 2, "PDCP" 3, "RLC" 4, "MAC" 5, "PHY" 6)
set xtics offset 0, 0.5

# set xlabel "Client movement speed (km/h)" offset 0, 0.7

unset key

set border lw 3

set style data histogram
set style histogram cluster gap 1
#set style fill solid border -1
# set samples 11
#set style fill solid 0.5 pattern border
# set style fill solid 0.5 border
set style fill solid 0
set boxwidth 0.75

set object 1 rectangle from -0.5,0.001 to 2.5,15000 fillstyle transparent solid 0.05 noborder fillcolor rgb 'black'
set object 1 rectangle from 2.5,0.001 to 6.5,15000 fillstyle transparent solid 0.5 noborder fillcolor rgb 'black'
# set object 2 rectangle from 85,-0.5 to 95,6 fillstyle transparent solid 0.05 noborder fillcolor rgb 'black'
# set object 3 rectangle from 135,-0.5 to 160,6 fillstyle transparent solid 0.05 noborder fillcolor rgb 'black'
# set object 11 rectangle from 240,-0.5 to 260,6 fillstyle transparent solid 0.05 noborder fillcolor rgb 'black'
# set object 12 rectangle from 265,-0.5 to 298,6 fillstyle transparent solid 0.05 noborder fillcolor rgb 'black'
# set object 13 rectangle from 302,-0.5 to 320,6 fillstyle transparent solid 0.05 noborder fillcolor rgb 'black'

set label "Control plane" at -0.3, 300
set label "User plane" at 2.8, 300 textcolor rgb 'white'

# set label "0.008" at -0.3, 0.1
# set label "0.0036" at 0.7, 0.03
# set label "0.1" at 1.8, 0.5
# set label "33.8" at 2.8, 30

plot "./msg_count.txt" using 2 lw 5 lt -1 fc rgb "#000000"




