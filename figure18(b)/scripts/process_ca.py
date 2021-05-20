f_l = "ca.metro.result"
# f_l = "proc-results/sampled.result"

f = open (f_l)

current_task = ("", "")
dict_month = {} 
month = 0
is_valid = 0

done_dict = {}

for line in f:
  if line[0] == '*':
    print line
    if len(line.strip().split()) != 4:
      is_valid = 0
      continue
    month = line.strip().split()[2][0:6]
    i = line.strip().split()[3]
    if (i in done_dict):
      is_valid = 0
    else:
      is_valid = 1
      done_dict[i] = 0
    if month not in dict_month:
      dict_month[month] = {}
  elif line[0] == '#':
    pos1 = line.find("mi2log")
    pos2 = line.find(" ", pos1)
    sub_line = line[pos2:-1]
    print line, sub_line, month
    month = sub_line[1:7]
    # month = line.strip().split()[1].split('/')[-1].split('_')[2][0:6]
    is_valid = 1
    if month not in dict_month:
      dict_month[month] = {}
  else:
    print (month)
    if not is_valid:
      continue
    d = line.strip().split(',')
    if len(d) < 4:
      continue
    cellid = d[2]
    if cellid not in dict_month[month]:
      dict_month[month][cellid] = []
    if d[3] != '1' and d[3] != '0':
      continue
    is_s = int(d[3])
    dict_month[month][cellid].append(is_s)


a =  dict_month.keys()
a.sort()
for m in a:
  print m,
  total_have = 0
  total = 0
  for cell in dict_month[m]:
    total += len(dict_month[m][cell])
    total_have += sum(dict_month[m][cell])
  perc =  float(total_have)/total if total > 0 else 0
  print total_have, total, perc
