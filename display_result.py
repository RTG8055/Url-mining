import os
import csv
import sqlite3
from search_relevant_docs import rank
import pandas as pd


# print("enter search term:")
query = raw_input("enter search term:")

doc_ids = rank(query)

print(doc_ids)
db = sqlite3.connect('webScraping.db')

# f= open('urls2.csv','r')
f= pd.read_csv('urls2.csv')

x = f[f.columns[0]]
y= f[f.columns[1]]
# print x[280]
url = None

for id in doc_ids:
	i=0
	for row in x:
		if(id==row):
			url = y[i]
			break
		i= i+1
	cursor = db.cursor()
	cursor.execute("select content from document where id = " + str(id))
	content  = cursor.fetchone()[0]
	print "\n" + url 
# f.close()


with open('urls2.csv','r') as oldcsv:
	with open('urls2new.csv','w') as newcsv:
		writer = csv.writer(newcsv, lineterminator = '\n')
		reader = csv.reader(oldcsv)

		all = []
		row = next(reader)
		row.append(query + '_relavant')
		all.append(row)
		writer.writerow(row)

		for row in reader:
			if(int(row[0]) in doc_ids):
				row.append('1')
			else:
				row.append('0')
			writer.writerow(row)
			all.append(row)
			# print row

os.remove('urls2.csv')
os.rename('urls2new.csv','urls2.csv')


# N = open('urls2.csv')
# r = csv.reader(N)
# row0 = r.next()
# row0.append(query + '_relavant')
# print row0
# for item in r:
# 	if(int(item[0]) in doc_ids):
# 		item.append('1')
# 	else:
# 		item.append('0')
# 	print item




	# print content

