import re

x = {'': 3, 'help': 1, 'quizlet': 1, 'in': 1, 'our': 1, 'find\n': 1, 'group': 1, ')': 1, '(': 1, '-': 1, ',': 1, 'also': 1, '7': 1, 'you': 1, 'more': 1, 'aqa': 1, u'flashcard': 1, '[': 1, ']': 1, u'resource': 1, 'center': 1, '17': 1, 'u': 10, 'can': 1, 'chemistry': 1, '|': 1, 'a-level': 1}
print x
print "\n"
for i in x:
	# print i
	print "\nI: " + i 
	print re.match(r'\n',i)
	i = re.sub(r'[-]','',i)
	i = re.sub('a','',i)
	i = re.sub(r'[0-9]+','',i)
	re.sub(r'\*+','',i)
	re.sub(r'[\n]','',i)
	re.sub(r'[_]+',' ',i)
	re.sub(r'[\d.*?]+','',i)

	print "\n I: " + i


print x