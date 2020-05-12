require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from https://www.bbcgoodfood.com

# 1. Define the ingredients we want recipes for
ingredients = ['chocolate']

# 3. For every ingredient, get all the recipies
def scrape_recipes(ingredient)
	url = "https://www.bbcgoodfood.com/search/recipes?query=#{ingredient}"

	html_string = open(url).read
	html = Nokogiri::HTML(html_string)

	# We are searching for this:
	# <h3 class="teaser-item__title">
	# 	<a href="">Chocolate brownies</a>
	# </h3>

	html.search(".teaser-item__title a")[0...2].each do |element|
		title = "********" + element.text + "********"
		url = element.attribute("href").value

		steps = scrape_steps(url)

		puts title

		steps.each_with_index do |step, index|
			puts "#{index + 1} - #{step}"
			puts
		end

		puts
	end
end

# 4. For every recipe, get all the preparation steps
def scrape_steps(path)
	url = "https://www.bbcgoodfood.com/#{path}"

	html_string = open(url).read
	html = Nokogiri::HTML(html_string)

	steps = []

	html.search(".method__item p").each do |element|
		steps << element.text
	end

	steps
end

# 2. scrape recipes for all our ingredients
ingredients.each do |ingredient|
	scrape_recipes(ingredients)
end

