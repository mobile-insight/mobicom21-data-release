#reset

set output  "dataset_growth_v6.eps"
set terminal postscript eps enh rounded color dashed dl 4 font ",36"


# set ylabel "Suspension (s)" offset 2, 0
# set ylabel "Dataset (GB)" offset 1.7, 0
# set ylabel "Number of over-the-air messages" offset 3,0
set ytics ("0" 0, "  200M" 1.33,  "3B" 3, "4B" 4, "5B" 5, "6B" 6)
set ytics rotate by 90 offset 0, 0.5
# set logscale y

# set xrange [-0.5:6.5]
# set xtics("2019/04" 0, "2019/05" 1, "2019/06" 2, "2019/07" 3, "2019/08" 4, "2019/09" 5, "PHY" 6)
# set xtics rotate by 45 offset -1, -1.3
set xtics rotate by 90 offset 0, -2.3

# set xlabel "Client movement speed (km/h)" offset 0, 0.7



set style data histogram
set style histogram rowstacked gap 1.1
# set style histogram cluster gap 1
#set style fill solid border -1
# set samples 11
set style fill pattern border
# set style fill solid 0.5 border
set boxwidth 0.75 relative


size = 1.2
kk = 0.22
bm = 0.25
lm=0.12
rm=0.95
gap=0.03
y1=0; y2=1.8;y3=2.5;y4=6.5

set multiplot
set border 1+2+8
set xtics nomirror
set ytics nomirror
set lmargin at screen lm
set rmargin at screen rm
set bmargin at screen bm
set tmargin at screen bm+size*kk

set border lw 3

unset key

set yrange [y1:y2]

eps=0.05
eps2=0.3
set arrow 3 from first -1-eps2,y2-eps to first -1+eps2, y2+eps nohead linewidth 5
set arrow 4 from first 19-eps2,y2-eps to first 19+eps2, y2+eps nohead linewidth 5

plot "./all_stat.txt" using ($5<1000000000)?$5/150000000:$5/1000000000 lw 4 lt -1 fc rgb "#000000" title ' ', \
"" using (($5<1000000000)?$6/150000000:$6/1000000000):xticlabel(1) lw 4 lt -1 fc rgb "#000000" title ' '


unset arrow



unset xtics
unset xlabel
set border 2+4+8
set bmargin at screen bm+size*kk+gap
set tmargin at screen bm+size+gap
set yrange[y3:y4]

set border lw 3

# set key samplen 1 spacing 1 width 0.5 at 1.85, 16 horizontal
unset key
set label 2 'User plane' at graph 0.05, 0.15 font ",32" left rotate by 90
set label 3 'Control plane' at graph 0.1, 0.15 font ",32" left rotate by 90

set object 5 rect from -0.2, 2.65 to 0.3, 2.9 fc rgb "white" fs pattern 1 lw 4 
set object 6 rect from 0.7, 2.65 to 1.2, 2.9 fc rgb "black" fs pattern 1 lw 4 


set arrow 5 from first -1-eps2,y3-eps to first -1+eps2, y3+eps nohead linewidth 5
set arrow 6 from first 19-eps2,y3-eps to first 19+eps2, y3+eps nohead linewidth 5

set ylabel "Number of over-the-air messages" offset 3,-3.5 font ",32"


plot "./all_stat_v6.txt" using ($5<1000000000)?$5/100000000:$5/1000000000 lw 4 lt -1 fc rgb "#000000" title ' ', \
"" using (($5<1000000000)?$6/100000000:$6/1000000000):xticlabel(1) lw 4 lt -1 fc rgb "#000000" title ' '

unset multiplot



