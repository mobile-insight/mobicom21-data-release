import matplotlib.pyplot as plt
import matplotlib.colors as colors
import numpy as np
from matplotlib.patches import Ellipse
# from pathlib import Path
import sys

font = {'family' : 'sans-serif',
        'sans-serif': 'Arial'}
plt.rcParams["font.family"] = "Arial"

myg = '#7fbf7b'
mygg = '#6f5f6b'
myb = '#0571b0'
myr = '#ca0020'
myo = '#f4a582'
myv = '#c2a5cf'


def plot_line(origf, syncf, simplef):
    ts1, unsampled = np.loadtxt(origf, usecols = (0, 1), unpack=True)
    ts2, sync= np.loadtxt(syncf, usecols = (0, 1), unpack=True)
    ts3, simple= np.loadtxt(simplef, usecols = (0, 1), unpack=True)

    # for i in range(len(ts1)):
        # if ts1[i] != ts2[i] or ts3[i] != ts2[i]:
            # print ts1[i], ts2[i], ts3[i]
        # try:
            # print ts1[i],i, list(ts2).index(ts1[i]), list(ts3).index(ts1[i])
            # print ts1[i], ts2[list(ts2).index(ts1[i])], ts3[list(ts3).index(ts1[i])]
        #     print abs(unsampled[i]-sync[list(ts2).index(ts1[i])]), abs(unsampled[i]-simple[list(ts3).index(ts1[i])])
        # except:
        #     pass

    # xdata = range(1, 7)
    fig, ax = plt.subplots(1, 1)
    linetypes = ['-', '--', ':', '--', '-.', '-']
    colors = [myg, myb, myr]
    counter = 0

    # # evaluation results for multiple flows across multiple tiers
    # plt.rcParams.update({'lines.markeredgewidth': 10})

    plt.plot(ts1-27, unsampled/2.0, color='lightgray', linewidth=1, linestyle=linetypes[0], label='Unsampled')
    pl1 = ax.fill_between(ts1-27, [0 for i in range(len(unsampled))], unsampled/2.0, hatch='...', color='gray', alpha=0.25)
    pl2 = ax.plot(ts3-27, simple/2.0, color=myb, linewidth=1, label='Naive sampling', linestyle=linetypes[1])
    pl3 = ax.plot(ts2-27, sync/2.0, color='k', linewidth=1, label='Optimized sampling', linestyle=linetypes[0])
    # plt.plot(ts1, unsampled, color='darkgray', linewidth=1, marker='o', markersize=2, label='Unsampled')
    # plt.plot(ts3, simple, color=myb, linewidth=1, marker='+', markersize=4, label='Naive sampling')
    # plt.plot(ts2, sync, color=myr, linewidth=1, marker='x', markersize=4, label='Optimized sampling')
    circle1 = Ellipse((12, 40/2.0), 3, 8, color=myr, fill=False, linestyle=linetypes[2])
    circle2 = Ellipse((35.5, 37/2.0), 3, 4,  color=myr, fill=False, linestyle=linetypes[2])
    circle3 = Ellipse((39, 36/2.0), 3, 4, color=myr, fill=False, linestyle=linetypes[2])
    circle4 = Ellipse((49.5, 35/2.0), 3, 4, color=myr, fill=False, linestyle=linetypes[2])
    circle5 = Ellipse((12.5, 25/2.0), 5, 4, color=myr, fill=False, linestyle=linetypes[2])
    circle6 = Ellipse((22, 24/2.0), 3, 4, color=myr, fill=False, linestyle=linetypes[2])
    circle7 = Ellipse((30, 27/2.0), 3, 4, color=myr, fill=False, linestyle=linetypes[2])
    circle8 = Ellipse((43, 24/2.0), 5, 4, color=myr, fill=False, linestyle=linetypes[2])

    # # Highlight optimized sampling's benefits
    # ax.add_artist(circle1)
    # ax.add_artist(circle2)
    # ax.add_artist(circle3)
    # ax.add_artist(circle4)
    # ax.add_artist(circle5)
    # ax.add_artist(circle6)
    # ax.add_artist(circle7)
    # ax.add_artist(circle8)

    
    # plt.fill_between(x, [ydata2[i] - yerr2_down[i] for i in range(len(ydata))], [ydata2[i] + yerr2[i] for i in range(len(ydata2))],label='PCL',hatch='', color=myb)

    # these are matplotlib.patch.Patch properties
    # props = dict(boxstyle='round', facecolor='wheat', alpha=0.5)
    # ax.text(0.4, 0.85, 'xxx', transform=ax.transAxes, fontsize=20,
    #     verticalalignment='top')

    # plt.ylabel('Avg Latency(ms)', fontsize=11)
    plt.ylabel('MAC queuing\n latency(ms)', fontsize=20)
    plt.xlabel('Time(s)', fontsize=20)
    plt.xticks(fontsize=20)
    plt.yticks(fontsize=20)
    # plt.xlim(54,59.1)
    plt.xlim(0,60)
    plt.ylim(10,25)
    plt.yticks(range(10,30,5))


    # plt.xticks([i for i in range(54,60,1)], [i for i in range(0,6,1)], fontsize=13)
    # plt.tight_layout()

    # plt.grid()
    # ['Unsampled', 'Naive sampling (10%)', 'Optimized sampling (10%)']
    lgd = plt.legend(fontsize=18, loc='upper left',ncol=2, frameon=False, bbox_to_anchor=(-0.05, 1.75), columnspacing=0.1, handletextpad=0.5)
    # plt.figure(figsize=(8,2))
    fig.set_figheight(1.5)
    fig.set_figwidth(7)
    fig.savefig("sample_mac_10.pdf", bbox_extra_artists=(lgd,), bbox_inches='tight') #, bbox_extra_artists=(lgd,)


plot_line('100.txt', '10t.txt', '10.txt')
# plot_line('100.txt', '20t.txt', '20.txt')
