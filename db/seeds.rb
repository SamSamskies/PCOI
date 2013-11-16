require 'csv'
require 'spreadsheet'

regions = ["the caribbean", "central america & mexico", "south america", "eastern europe & central asia", "asia", "north america & the middle east", "africa", "the pacific islands" ]

sectors = ["education", "health", "community economic development", "environment", "youth in development", "agriculture", "other"]


print "Creating Regions"
regions.each do |region|
  Region.create name: region
end

region_ids = Region.pluck :id


print "Creating Sectors"
sectors.each do |sector|
  sector = Sector.create name: sector
end

sector_ids = Sector.pluck :id

print "Creating Countries"
CSV.foreach("./db/countries.csv") do |row|
  country = Country.create name: row.first.strip, region_id: region_ids.sample
end


print "Creating Jobs"
Spreadsheet.client_encoding = 'UTF-8'

file = File.join(Rails.root, 'db', 'jobs.xls')
book = Spreadsheet.open file
sheet1 = book.worksheet 0

sheet1.each_with_index do |line, i|
	print i += 1
	sector = line[4]

	next if line == []
	next if line[0] == 'Pending' || line[0] == "0" || line[0] == "CURRENT REQ STATUS"
	next if line[16].nil? || line[16] == 'SEE ABOVE'
	next if sector == 'Married Couples Req'
	description = line[16]
	application_deadline = line[10]
	departure_date = line[12]
	notification_date = line[11]
	year = line[1][2..-1]
	quarter = line[2].split(' ')[-1].to_i
	open_positions = line[7].to_i
	title = line[8].split(' ')[1..-1].join(' ')
	sector_id = ""
	country_id = Country.find_by_name(line[5]).id unless Country.find_by_name(line[5]).nil?

	if sector == 'Environment'
		sector_id = 4
	elsif sector == 'Agriculture'
		sector_id = 6
	elsif sector == 'Health'
		sector_id = 2
	elsif sector == 'Business'
		sector_id = 3
	elsif sector == 'Youth'
		sector_id = 5
	elsif sector == 'Education'
		sector_id = 1
	else
		sector_id = 7
	end

	job = Job.create(
		:application_deadline => application_deadline,
		:departure_date => departure_date,
		:description => description,
		:notification_date => notification_date,
		:open_positions => open_positions,
		:physical_requirements => line[14],
		:quarter => quarter,
		:skills => line[15],
		:year => year,
		:country_id => country_id,
		:title => title
		)
	job.update sector: Sector.find(sector_id)
end
