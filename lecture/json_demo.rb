require 'json'

# READ
filepath    = 'data/beers.json'

# returns a string
json_beers = File.read(filepath)

# string to hash
beers = JSON.parse(json_beers)

p beers
p beers.class

# p beers['title']

# array
beers['beers'].each do |beer|
	# beer = hash
	p beer['name']
end

# WRITE
beers = { 
	title: 'Nice beers',
	beers: [
	  {
	    name:       'Edelweiss',
	    appearance: 'White',
	    origin:     'Austria'
	  },
	  {
	    name:       'Guinness',
	    appearance: 'Stout',
	    origin:     'Ireland'
	  }
	]
}

filepath = 'json_demo_beers.json'

File.open(filepath, 'wb') do |file|
	file.write(JSON.generate(beers))
end







