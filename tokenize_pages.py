from os import listdir
import sqlite3
from os.path import join
import numpy
from nltk.tokenize import word_tokenize
import tfidf
import nltk
from nltk.probability import FreqDist
# from django.db.models import Count
import math
from nltk.stem.wordnet import WordNetLemmatizer
from stop_words import get_stop_words
from string import punctuation
import re
from nltk.corpus import stopwords


wordnet = WordNetLemmatizer()


def remove_stop_words(freq_list):
	# stop_words = get_stop_words('en')
	# stop_words.update(['[','\'',']'])
	stop_words = set(stopwords.words('english'))
	stop_words.update(['.', ',', '"', "'", '?', '!', ':', ';', '(', ')', '[', ']', '{', '}',' ','%','&','|',r'[\d]+','  ','','e','u','-','search','searchsearch','searching','www','x','xa','wordpress.com','.com','com','could','get','find','gmail','google','go','copyright','loading','working','request','entire','playlist','youtube','clear','watch','undo','sign','see','want','recommendation','\\n','channel','404','http','url','invalid','bad','error','create','free','file','com','found','login','log','request','Bad','please','this','website','works','javascript','switched','on','enable','links']) # remove it if you need punctuation 
	stop_words.update(['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'])
	# type(stop_words)
	# stop_words.add('u\'[\'')
	# print stop_words
	# stop_words

	print freq_list
	temp_list ={}
	for key in freq_list:
		# print key

		# re.sub()
		if key not in stop_words:
			temp_list[key] = freq_list[key]

	return temp_list


def remove_punctuation(word_freq):
	temp_list={}
	for key in word_freq:
		if(key not in punctuation):
			temp_list[key] = word_freq[key]


def get_term_freq_dict(data):
	# Change it to lower case
	lower_data = data.lower()
	
	# Tokenize it
	tokens = word_tokenize(lower_data)

	# tokens = re.sub(r"[']+", r"",tokens)
	# tokens = [i.replace("[\']+","") for i in tokens]
	tokens2=[]
	for i in tokens:
		i =re.sub(r'[-]+',' ',i)
		i = re.sub(r"[']+",'',i)
		i= re.sub(r'[com]$','',i)
		# re.sub('')
		i = re.sub(r'[0-9]+','',i)
		i = re.sub(r'\*+','',i)
		i = re.sub(r'[\n]+','',i)
		i = re.sub(r'[_]+',' ',i)
		i = re.sub(r'[\d.*?]+','',i)
		# if(i[0] == "\'"):
			# i= i[1:]
		a = word_tokenize(i)
		for x in a:
			tokens2.append(x)
	# print tokens
	print tokens2
	tokens = tokens2

	# for i in tokens:
		# i.replace(r"[']+",r"")
	# print tokens
	freq_dist = FreqDist(tokens)
	
	# Lemmatize it
	word_freq = {}
	
	for term in freq_dist.keys():
		lemmatize_term = wordnet.lemmatize(term)
		val = freq_dist.get(term)
		
		# If it exist in word_freq, add value
		if lemmatize_term in word_freq:
			freq = word_freq[lemmatize_term]
			word_freq[lemmatize_term] = freq + val
			
		# Else, assign value
		else:
			word_freq[lemmatize_term] = val
	
	word_freq = remove_stop_words(word_freq)
	print word_freq
	# word_freq = remove_punctuation(word_freq)
	# print word_freq
	# word_freq = word_freq.map(lambda x: str_stemmer_wo_parser(x))
	
	return word_freq


def process_data(data,doc_id):
	freq_dist = get_term_freq_dict(data)
	print str(doc_id) + "\n"
	print freq_dist
	# Insert into db
	# Save document
	# doc = Document(content=data)
	# doc.save()
	db = sqlite3.connect("webScraping.db")
	db.execute("insert into Document(id,content) values(" + str(doc_id) + ",\"" + data + "\")")

	print "processing doc %d %s" % (doc_id, data[:10])
	
	# Save term frequency
	#terms = []
	
	# db= sqlite3.connect("webScraping.db")

	term= None
	# document_id =None
	freq = None
	score =0

	# Retrieve Django TermFrequency list of objects
	# words is a dictionary contain key + freq
	if(freq_dist != None):
		for word in freq_dist:
			# term = TermFrequency()
			term= word
			freq = freq_dist.get(word)
			# score = 0
			# terms.append(term)
			print "'" + term + "'," + str(doc_id) + "," + str(freq) + "," + str(score) + ")"
			db.execute("insert into termFrequency(term,document_id,frequency,score) values(\"" + term + "\"," + str(doc_id) + "," + str(freq) + "," + str(score) + ")")		
	# Save to DB
	# TermFrequency.objects.bulk_create(terms)
	
	db.commit()


def tokenize_docs():
	# Run once
	# if TermFrequency.objects.all().exists():
		# return
	
	# Else, process files
	# Get list of files inside docs
	# files = listdir("docs")
	# files.sort()
	# print(files)
	# doc_id =1
	# path = 'page' + str(doc_id) + '.txt'
	# Read content of files
	# for p in files:
	# 	with open(join("docs", path)) as f:
	# 		data = f.read()
	# 		print data
			process_data(data,doc_id)
			# doc_id=doc_id+1
			# path = 'page' + str(doc_id) + '.txt'
			# if(doc_id==10):
				# break
	
# Calculate number of appearance of each term in whole
# document space        

def calculate_docs_frequency():
	# Run once
	# if DocFrequency.objects.all().exists():
		# return
	
	# Else, insert data
		
	# Group by 'term' and Count it
	# q = TermFrequency.objects.values('term').annotate(num_docs=Count('term'))
	db = sqlite3.connect("webScraping.db")
	db.execute("insert into docfrequency(term, num_occ_in_docs) SELECT term,SUM(frequency)   FROM termfrequency GROUP BY term;")
	db.commit();

	
	# Create Django object
	# doc_freqs = [DocFrequency(**item) for item in q]
	
	# Save it
	# DocFrequency.objects.bulk_create(doc_freqs)

# Calculate tfidf for each term
def calculate_tfidf():
	# q = TermFrequency.objects.all()
	
	# n = DocFrequency.objects.count()
	

	db=sqlite3.connect("webScraping.db")
	cursor=db.cursor()
	cursor.execute("select count(*) from DocFrequency;")
	n = cursor.fetchone()[0]
	q= db.execute("select term from termfrequency;")


	for item in q:
		# doc_freq = DocFrequency.objects.filter(term=item.term)[0]
		# print str(item[0])
		cursor=db.cursor()
		cursor.execute("select num_occ_in_docs from docfrequency where term = \"" + str(item[0]) + "\"")
		doc_freq = cursor.fetchone()[0]

		print doc_freq
		print "\n"	
		# Calculate tfidf here
		# item.score = item.frequency * math.log10(n/doc_freq.num_docs)
		cursor = db.cursor()
		cursor.execute("select frequency from termfrequency where term  = \"" + str(item[0]) + "\"")
		term_freq = cursor.fetchone()[0]
		print term_freq
		print "\n"
		score = term_freq * math.log10(n/doc_freq)
		db.execute("UPDATE termfrequency SET score = " + str(score) + " WHERE term = " + "\"" + str(item[0]) + "\"");

		db.commit()
		# db.execute("insert into termfrequency(score) values (" + str(score) + ") where term = \"" + item + "\";")
		# item.save()

#one time execution fun 1 and fun 2
# tokenize_docs()   #fun 1
# calculate_docs_frequency()		#fun2
# calculate_tfidf()