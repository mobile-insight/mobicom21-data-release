
from ast import literal_eval as make_tuple


# f_lis = ["ca/ca_bd_complete.result", "ca/ca_bd_sampled.result", "ca/ca_bd_milab.result" ]
f_lis = ["ca_bd_complete.result", "ca_bd_milab.result", "ca_bd_old_wl.result", "ca_bd_wl.result", "ca_sampled_wl.txt","ca_sampled_2_wl.txt","ca_sampled_3_wl.txt","ca_sampled_old_wl.txt"]

done_dict = {}

phone_dict = {}


for f_l in f_lis:

  f = open (f_l)


  is_valid = 1
  phone = "Unknown"

  for line in f:
    # if line[0] == '(' and line[0:4] != "(MI)":
    #   line_tuple = make_tuple(line.strip())
    # else:
    #   continue
    line_tuple = line.strip().split()
    if line_tuple[0] == '*':
      # phone = line_tuple[1].split('_')[-1]
      # if not phone in done_dict:
      #   done_dict[phone] = {'total_ca': 0, 'total_n_ca': 0,'total_nca': 0,'total_n_nca': 0, 'max_bw': 0}
      pass
      
    elif line_tuple[0] == '#':
      file_name = line_tuple[1].split('/')[-1]

      phone_tmp = file_name.split('.')[0].split('_')
      if len(phone_tmp) < 2:
        phone =  phone_tmp[0]
      else:
        phone = phone_tmp[-2]
      # print line, phone
      if not phone in done_dict:
        done_dict[phone] = {'total_ca': 0, 'total_n_ca': 0,'total_nca': 0,'total_n_nca': 0, 'max_bw': 0}

      # file_name = line.strip().split()[1].split('/')[-1]
      if file_name in done_dict[phone]:
        continue
      else:
        done_dict[phone][file_name] = {}
        is_valid = 1
    
    else:
      if is_valid == 0:
        continue
      d = line_tuple
      if len(d) != 4 and len(d) != 5:
        continue
      if (d[1],d[2]) not in done_dict[phone][file_name]:
        done_dict[phone][file_name][(d[1],d[2])] = []
      if (len(d) == 4):
        is_ca = 0
      else:
        is_ca = d[4]
      # is_ca = d[3]
      # if (is_ca == "1"):
      #   done_dict[month]['total_n_ca'] += 1
      # else:
      #   done_dict[month]['total_n_nca'] += 1
      if (d[3], is_ca) not in  done_dict[phone][file_name][ (d[1],d[2]) ]:
        done_dict[phone][file_name][(d[1],d[2])].append((d[3],is_ca))        
        if (is_ca > 0):
          done_dict[phone]['total_n_ca'] += 1
          done_dict[phone]['total_ca'] += int(d[3])
        else:
          done_dict[phone]['total_n_nca'] += 1
          done_dict[phone]['total_nca'] += int(d[3])
        if int(d[3]) > done_dict[phone]['max_bw']:
          done_dict[phone]['max_bw'] = int(d[3])
      
     
a =  done_dict.keys()
a.sort()
# print a

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
  print (total_ca + total_nca) / (total_n_ca+total_n_nca) if (total_n_ca+total_n_nca) > 0 else 0,
  print done_dict[m]['max_bw']
  # print total_n_ca, total_n_nca


