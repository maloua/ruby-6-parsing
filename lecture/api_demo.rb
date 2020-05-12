require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username

url = "https://api.github.com/users/ssaunier"

data = open(url).read

user = JSON.parse(data)

p user
p user.class

puts user["login"]