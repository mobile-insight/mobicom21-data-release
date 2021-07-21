f_list = open("done.list")
processed_file = {}
dict_month = {}
dict_type = {}

user_list = ["LTE_PDC", "LTE_RLC", "LTE_MAC", "LTE_PHY"]
control_list = ["LTE_RRC", "LTE_NAS_EMM", "LTE_NAS_ESM"]
for user in user_list:
  dict_type[user] = 0
for control in control_list:
  dict_type[control] = 0

for files in f_list:
  current_line = 0
  is_valid = 1
  f = open("res/" + files.strip())
  for line in f:
    try:
      d = line.strip().split()
      if len(d) <= 1:
        continue
      if d[0] == '*':
        (task, n_line) = (d[1], d[2])
        if int(n_line) <= int(current_line):
          is_valid = 0
        else:
          is_valid = 1
          current_line = n_line
      if d[0] == '#':
        filename = d[1]
        if '/' in filename:
          filename = filename.split('/')[-1]
          # print d[1], filename
        if filename in processed_file:
          is_valid = 0
        else :
          processed_file[filename] = 0
          month = d[2]
          fsize = float(d[3][0:-2])
          if month not in dict_month:
            dict_month[month] = {"Size": 0, "Total_message": 0}
          dict_month[month]['Size'] += fsize
      if is_valid == 0:
        continue
      if d[0] != '#' and d[0] != '*':
        (msg_type, cnt) = ("Total_message", d[2]) if d[0] == "Total" else (d[0], d[1])
        if msg_type not in dict_month[month]:
          dict_month[month][msg_type] = 0
        dict_month[month][msg_type] += int(cnt)
    except:
      print d

sorted_list =  dict_month.keys()
sorted_list.sort()

for month in sorted_list:
  total = 0
  if month[0:4] not in ['2015', '2016', '2017', '2018', '2019', '2020']:
    continue 
  total_c = 0
  total_u = 0
  for k in dict_month[month]:
    if k[0:7] in user_list:
      dict_type[k[0:7]] += dict_month[month][k]
      total_u += dict_month[month][k]
    elif k[0:7] in control_list:
      dict_type[k[0:7]] += dict_month[month][k]
      total_c += dict_month[month][k]
    elif k[0:11] in control_list:
      dict_type[k[0:11]] += dict_month[month][k]
      total_c += dict_month[month][k]

  print month, dict_month[month]['Size'], total_u, total_c

print dict_type

