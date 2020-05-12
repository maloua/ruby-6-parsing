require 'csv'

# READ
filepath_old_data    = 'data/beers.csv'
csv_options = {
	headers: :first_row,
}

CSV.foreach(filepath_old_data, csv_options) do |row|
	# p row
	puts "#{row["Name"]}, a beer from #{row["Origin"]}"
	# p row.class
end
puts

# WRITE
filepath_new_data = 'csv_demo_beers.csv'
csv_options_2 = {
	headers: :first_row,
	col_sep: ','
}

CSV.open(filepath_new_data, 'wb', csv_options_2) do |csv|
	csv << ["Name", "Origin"]
	csv << ["Guiness", "Dublin", "", "Something value"]
	csv << ["Guiness", "Dublin"]
end

# write 2
filepath_new_data = 'csv_demo_arrays.csv'
data = [
	["Guiness", "Dublin"],
	["Asahi", "Japan"]
]

CSV.open(filepath_new_data, 'wb', csv_options_2) do |csv|
	data.each do |beer_array|
		csv << beer_array
	end
end














