# Url-mining
python script to do the following:
  - scrape webpages from a list of urls available.
  - beautify the webpages by extracting only the 'p' tags for getting an idea on what the webpage contains
  - tokenizing the scraped webpages and cleaning (making them all lower case,removing stopwords and stemming)
  - saving the content document wise in a sqlite database
  - count the term and document frequencies and storing them in the database
  - calulating the score for each term using tfidf and storing it.
  
  - getting the search term from console as raw input searching the the database for matches and ranking accordingly.
  - sorting the matched urls based on these ranks generated in descending order and displating the top 100 results.
