from bs4 import BeautifulSoup
from os.path import join
import requests
import re
import sqlite3
import tokenize_pages

#r  = requests.get('https://medium.freecodecamp.org/how-to-scrape-websites-with-python-and-beautifulsoup-5946935d93fe,')

#data = r.content

#soup = BeautifulSoup(data)
#soup.prettify()

#html=soup.get_text()
urls = open('urls_extracted.txt','r')
# db = sqlite3.connect("webScraping.db")
# urls = ['https://www.ticketmaster.co.uk/member?tm_link=tm_homeA_header_name','http://www.ticketmaster.co.uk/']
y = '1'
page_name='page' + y + '.txt'

for Iurl in urls:
	try:
		r=requests.get(Iurl)
		data=r.content
		soup= BeautifulSoup(data)
		soup.prettify()
		#html=soup.get_text()
		words_list= []

		for link in soup.find_all('p'):
			content = link.text 
			words = content.lower().split()
			cleaned_words= re.sub("[^A-Za-z]+"," ",str(words))
			words_list.append(cleaned_words)

		words_list.append(soup.find('title').text)
				

		# file = open ( "docs2\\\\" + page_name , 'w')
		file= open(join('docs',page_name),'w')
		file.write(str(words_list))
		words_list2 = [i.encode('utf-8') for i in words_list]
		tokenize_pages.process_data(str(words_list2),int(y))
		file.close()
		# if(int(y)>=50):
			# break

		# x= '\\\abc'
		# print(r + x)
		# print( join(r,Iurl))
		# db.execute("update document set link = r" + Iurl[8:] + " where document_id = " + y)
		# print('def')

		# y= str(int(y) + 1)
		# page_name = 'page' + y + '.txt'	
	except Exception as e:
		print(e)
	else:
		print('else')
		# db.commit()
	finally:
		print(page_name + " done\n")
		y= str(int(y) + 1)
		page_name = 'page' + y + '.txt'	





