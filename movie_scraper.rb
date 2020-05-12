# scrape the top 5 movies from IMDB
# https://www.imdb.com/chart/top
# and write it to a movies.yml file

require "open-uri" # to read from an url
require "nokogiri" # to parse the html doc
require "yaml" # to convert to yaml

# go scrape the information from the site 
url = "https://www.imdb.com/chart/top"
html_string = open(url).read
html_doc = Nokogiri::HTML(html_string)

# initalize an empty array to save my movies in
movies_arr = []

html_doc # open the doc
	.search(".titleColumn a") # inspect imdb --> check where the titles are
	.first(5) # only pick the first 5 movies
	.each do |element| # iterate over the movies
		url = element.attribute("href").value
	
		# save every movie in an array 
		# --> { name: movie_name }
		movies_arr << { name: element.text, url: url }
end

puts movies_arr

# convert the array into yaml
movies_yaml = movies_arr.to_yaml

# save the yaml in a file
File.open('movies.yml', 'w') do |file|
	file.write(movies_yaml)
end

