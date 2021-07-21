mode = 0
f_l = ["complete-mmlabv2-all.txt"]

for f_name in f_l:

  f = open (f_name)

  current_task = ("", "")
  dict_month = {} 
  month = 0

  for line in f:
    if line[0] == '*':
      if mode == 0:
        current_task = (line.split()[1], line.split()[2])
        month = current_task[1][0:6]
      elif mode == 1:
        taskname = line.strip().split('/')[3]
        if taskname == 'mi2log_columbus':
          month = 0
        else:
          f_list = line.strip().split('/')[-1].split('_') 
          month = 0
          for i in range(len(f_list)):
            if f_list[i] == "log":
              month = f_list[i+1][0:6]
      elif mode == 5:
        month = line.split()[1]
        # month = "2"

      if month not in dict_month:
        dict_month[month] = {}
    else:
      d = line.split()
      if (d[0] == 'Certain' or d[0] == 'MI(Ignore)' or d[0] == "(MI)Unknown" or d[0] == "here" or d[0] == "start"):
        continue
      for i in range(7):
        d[i] = int(d[i])

      if (mode != 1 and len(d) == 8 and d[0] * d[1] * d[2] * d[3] * d[4] * d[5] * d[6] != 0 and d[7] == "Noretx" and d[0] == 310) or (mode == 1 and len(d) == 7 and d[0] * d[1] * d[2] * d[3] * d[4] * d[5] * d[6] != 0 and d[0] == 310):
        config = (d[0], d[1], d[2], d[3], d[4])
        
        sr = d[6]
        if (sr not in dict_month[month]):
          dict_month[month][sr] = {'sr_config_pkt': 0, 'sr_config_cell':[] }
        
        dict_month[month][sr]['sr_config_pkt'] += 1
        if (config not in dict_month[month][sr]['sr_config_cell']):
          dict_month[month][sr]['sr_config_cell'].append(config)


sorted_list =  dict_month.keys()
sorted_list.sort()

for m in sorted_list:
  print m
  for sr in dict_month[m]:
    print sr, dict_month[m][sr]['sr_config_pkt'], len(dict_month[m][sr]['sr_config_cell'])

config_list = [5, 10, 20, 40, 80]

# for m in sorted_list:
#   total_a = 0
#   total_a_n = 0
#   total_b = 0
#   total_b_n = 0
#   total_not_10 = 0
#   for sr in dict_month[m]: 
#     if sr not in config_list:
#       config_list.append(sr)
#     a = dict_month[m][sr]['sr_config_pkt']
#     total_a += a * sr
#     total_a_n += a

#     b = len(dict_month[m][sr]['sr_config_cell'])
#     total_b += b * sr
#     total_b_n += b
#     if sr > 10:
#       total_not_10 += b

#   if (total_a_n * total_b_n > 0):
#     print m, float(total_a)/total_a_n, float(total_b)/total_b_n, total_a_n, total_b_n, total_not_10, float(total_not_10)/total_b_n
  
print "start here"

for sr in config_list:
  print sr,
print 

for m in sorted_list:
  total_a = 0
  total_a_n = 0
  total_b = 0
  total_b_n = 0
  total_not_10 = 0
  print m,
  for sr in dict_month[m]:
    b = len(dict_month[m][sr]['sr_config_cell'])
    total_b_n += b

  if total_b_n == 0:
    print m
    continue
  for sr in config_list:
    if sr not in dict_month[m]:
      print 0,
    else:
      print len(dict_month[m][sr]['sr_config_cell']),
  print 
    
    