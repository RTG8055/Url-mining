from tokenize_pages import get_term_freq_dict
import sqlite3
import math

# def process_query(data):
    # Return term
    # print get_term_freq_dict(data).keys()
    # return get_term_freq_dict(data).keys()

def rank(query):
	terms = query.lower().split()
	params =  str(tuple(terms))
	if len(terms) > 1:
		params = str(tuple(terms))
	elif len(terms) == 1:
		params = "(\'" + str(terms[0]) + "\')"
	else:
		return

	raw_sql = "" + \
	"SELECT document_id, Group_Concat(term), SUM(score) as total_score " + \
	"FROM termfrequency " + \
	"WHERE term IN " + params + \
	" GROUP BY document_id " + \
	"ORDER BY total_score DESC " + \
	""
	print raw_sql
	doc_ids = list()

	#execute the sql
	db = sqlite3.connect("webScraping.db")
	cursor = db.cursor()
	cursor.execute(raw_sql)
	for row in cursor:
		# print row[0]
		doc_ids.append(row[0])
	# doc_ids = cursor['document_id']
	# doc_ids = cursor.getString(0)
	# print doc_ids
	return doc_ids



# ids = rank(raw_input())


