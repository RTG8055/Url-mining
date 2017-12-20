import csv
import sqlite3

db= sqlite3.connect("WebScraping.db")
cursor = db.cursor()
cursor.execute("Select * from termfrequency")

with open('TermFrequency.csv','w') as tf:
	writer = csv.writer(tf, lineterminator = '\n')
	row = ["id","term","document_id","frequency","score"]
	writer.writerow(row)
	for row in cursor:
		# row = cursor.fetchone()
		writer.writerow(row)



