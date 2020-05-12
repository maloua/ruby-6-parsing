require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from https://www.bbcgoodfood.com

url = "https://www.bbcgoodfood.com/search/recipes?query=chocolate"

html_string = open(url).read
html = Nokogiri::HTML(html_string)

# We are searching for this:
# <h3 class="teaser-item__title">
# 	<a href="">Chocolate brownies</a>
# </h3>

html.search(".teaser-item__title a").each do |element|
	puts element.text
end
