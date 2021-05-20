



# f_lis = ["ca/ca_bd_complete.result", "ca/ca_bd_sampled.result", "ca/ca_bd_milab.result" ]
f_lis = ["ca_bd_old_wl.result", "ca_bd_wl.result", "ca_sampled_wl.txt","ca_sampled_2_wl.txt","ca_sampled_3_wl.txt","ca_sampled_old_wl.txt"]

done_dict = {}


for f_l in f_lis:

  f = open (f_l)

  month = 0
  is_valid = 0

  for line in f:
    if line[0] == '#':
      try:
        # if not ("west" in line):
        #   is_valid = 0
        #   continue
        # if "AT&T" not in line and "310410" not in line:
        #   is_valid = 0
        #   continue

        file_name = line.strip().split()[1].split('/')[-1]
        month = file_name.split('_')[2][0:6]
        # print file_name, month
        if month not in done_dict:
          done_dict[month] = {'total_ca': 0, 'total_n_ca': 0,'total_nca': 0,'total_n_nca': 0}
        if file_name in done_dict[month]:
          is_valid = 0
          continue
        else:
          done_dict[month][file_name] = {}
          is_valid = 1
        # if "old" in line:
        # if "AT&T" in line or "310410" in line:
        #   month = line.strip().split()[1].split('/')[-1].split('_')[2][0:6]
        #   is_valid = 1
        #   if month not in dict_month:
        #     dict_month[month] = {}
        # else:
        #   is_valid = 0
        #   continue
      except:
        is_valid = 0
    else:
      if is_valid == 0:
        continue
      d = line.strip().split()
      if len(d) != 4 and len(d) != 5:
        continue
      if (d[1],d[2]) not in done_dict[month][file_name]:
        done_dict[month][file_name][(d[1],d[2])] = []
      if (len(d) == 4):
        is_ca = 0
      else:
        is_ca = d[4]
      if (d[3], is_ca) not in  done_dict[month][file_name][ (d[1],d[2]) ]:
        done_dict[month][file_name][(d[1],d[2])].append((d[3],is_ca))        
        if (is_ca > 0):
          done_dict[month]['total_n_ca'] += 1
          done_dict[month]['total_ca'] += int(d[3])
        else:
          done_dict[month]['total_n_nca'] += 1
          done_dict[month]['total_nca'] += int(d[3])
      
     
    
a =  done_dict.keys()
a.sort()
print a
for m in a:
  print m,
  total_n_ca = done_dict[m]['total_n_ca']
  total_ca = done_dict[m]['total_ca']
  total_n_nca = done_dict[m]['total_n_nca']
  total_nca = done_dict[m]['total_nca']
  avg_tput_ca = total_ca/total_n_ca if total_n_ca > 0 else 0
  avg_tput_nca =  total_nca/total_n_nca if total_n_nca > 0 else 0
  print total_n_ca, avg_tput_ca,
  print total_n_nca, avg_tput_nca,
  print float(total_n_ca)/(total_n_ca+total_n_nca) if (total_n_ca+total_n_nca) > 0 else 0,
  print (total_ca + total_nca) / (total_n_ca+total_n_nca) if (total_n_ca+total_n_nca) > 0 else 0



