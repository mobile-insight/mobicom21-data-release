dict_cell = {}

# f_l = ["proc-results/complete-mmlabv2-all.txt", "proc-results/old_complete_2.result"]
f_l = ["complete-mmlabv2-all.txt"]

dict_month = {}
for f_n in f_l:
  f = open (f_n)
  # if (i == 1):
  #   mode = 0
  # else:
  mode = 0

  current_task = ("", "")
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

      if month not in dict_month:
        dict_month[month] = {"lat": [], "wait": [], "tx": [], "retx" : 0, "noretx": 0}
    elif mode == 3 and line[2] == '*':
      f_list = line.strip().split('/')[-1].split('_') 
      month = 0
      for i in range(len(f_list)):
        if f_list[i] == "log":
          month = f_list[i+1][0:6]
      if month not in dict_month:
        dict_month[month] = {"lat": [], "wait": [], "tx": [], "retx" : 0, "noretx": 0}
    else:
      d = line.split()
      # print d, len(d)
      if (d[0] == 'Certain' or d[0] == 'MI(Ignore)' or d[0] == "(MI)Unknown" or d[0] == "None" or d[0] == "here" or d[0] == "start"):
        continue
      for i in range(7):
        d[i] = int(d[i])

      if (d[0] * d[1] * d[2] * d[3] * d[4] == 0) or d[0] != 310:
        continue
      config = (d[0], d[1], d[2], d[3], d[4])

      if len(d) == 8:
        if d[7] == "Retx":
          dict_month[month]['retx'] += 1
        if d[7] == "Noretx":
          dict_month[month]['noretx'] += 1

      if len(d) == 16:
        t1 = int(d[9])
        t2 = int(d[12])
        t3 = int(d[15])
        dict_month[month]['lat'].append(t1+t2+t3)
        dict_month[month]['wait'].append(t1)
        dict_month[month]['tx'].append(t2)

sorted_list = dict_month.keys()
sorted_list.sort()

for each_month in sorted_list:
  l1 = dict_month[each_month]['lat'].sort()
  l2 = dict_month[each_month]['wait'].sort()
  l3 = dict_month[each_month]['tx'].sort()
  leng = len(dict_month[each_month]['lat'])
  if (leng == 0):
    # print each_month, 0
    continue
  leng_90 = int(leng * 0.9)
  leng_95 = int(leng * 0.95)
  l1_avg = sum(dict_month[each_month]['lat']) / leng
  l1_90 = dict_month[each_month]['lat'][leng_90]
  l1_95 = dict_month[each_month]['lat'][leng_95]
  l2_avg = sum(dict_month[each_month]['wait']) / leng
  l2_90 = dict_month[each_month]['wait'][leng_90]
  l2_95 = dict_month[each_month]['wait'][leng_95]
  l3_avg = sum(dict_month[each_month]['tx']) / leng
  l3_90 = dict_month[each_month]['tx'][leng_90]
  l3_95 = dict_month[each_month]['tx'][leng_95]
  retx_rate = float(dict_month[each_month]['retx']) / (dict_month[each_month]['retx'] + dict_month[each_month]['noretx'])
  print each_month, leng, l1_avg, l1_90, l1_95, l2_avg, l2_90, l2_95, l3_avg, l3_90, l3_95, retx_rate
