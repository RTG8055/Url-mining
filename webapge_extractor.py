import urllib2
import html2text
import sys


urls= open('extracted_urls.txt','r')
url=list()
for sitelink in urls:
	url.append(x)
	

y='1'
x='page' + y

for url in urls:
	page=urllib2.urlopen(url)
	html_content=page.read()
	reload(sys)
	sys.setdefaultencoding('utf-8')
	rendered_content=html2text.html2text(html_content)
	f=open('page1','w')
	f.write(rendered_content)
	f.close()
	y=y+1
	x='page' + y

