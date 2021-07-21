# Usuage: python process_db.py [filename]

import sys, os, subprocess

def get_logs(filename, year, season):
	if season == 'Q1':
		month = ['01', '02', '03']
	elif season == 'Q2':
		month = ['04', '05', '06']
	elif season == 'Q3':
		month = ['07', '08', '09']
	elif season == 'Q4':
		month = ['10', '11', '12']
	first_month = False
	newfile = str(year) + '-' + str(season) + '-' + filename[15:] 
	for mt in month:
		ts = str(year) + '-' + mt
		if 'HO' in newfile or 'RRC' in newfile:
			maxi = 1000
		else:
			maxi = 10000
		if not first_month:
			cmd = "grep '"+ ts + "' " + filename + " | awk -F'|' '$2<" + str(maxi) +" {print $2}' | sort -n > " + newfile
		else:
			cmd = "grep '"+ ts + "' " + filename + " | awk -F'|' '$2<" + str(maxi) +" {print $2}' | sort -n >> " + newfile
		# print cmd
# 10521|141.08200000000002|2018-01-18 20:11:59.695235|ATT||None|None|48898058|19980|850|18850|20 MHz|20 MHz|None|2
		os.system(cmd)
		first_month = True

	# print str(year)+'-'+season,
	if os.stat(newfile).st_size > 20: # ignore the only record
		cmd = "echo '"+ str(year)+'-'+season + "' $(" + "sort -k1n,1 " + newfile + "| awk '{all[NR] = $1} END{print all[int(NR*0.5 - 0.5)]}')"
		# sort -k1n,1  $file | awk '{all[NR] = $1} END{print all[int(NR*0.5 - 0.5)]}'
		# echo "test "$(wc -l sdcard/bat1.txt )

		# print cmd
		os.system(cmd)
	os.system("rm " + newfile)


for year in [2017, 2018, 2019, 2020]:
	for season in ['Q1', 'Q2', 'Q3', 'Q4']:
		get_logs(sys.argv[1], year, season)

# KPI_Accessibility_HO_LATENCY
# KPI_Accessibility_RRC_LATENCY
# KPI_Mobility_HANDOVER_LATENCY
# KPI_Accessibility_SR_LATENCY
# KPI_Mobility_TAU_LATENCY