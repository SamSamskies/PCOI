require 'csv'
require 'spreadsheet'

regions = ["the caribbean", "central america & mexico", "south america", "eastern europe & central asia", "asia", "north america & the middle east", "africa", "the pacific islands" ]

sectors = ["education", "health", "community economic development", "environment", "youth in development", "agriculture", "other"]


print "Creating Regions"
regions.each do |region|
  Region.create name: region
end

print "Creating Sectors"
sectors.each do |sector|
  sector = Sector.create name: sector
end

sector_ids = Sector.pluck :id

print "Creating Countries"
CSV.foreach("./db/countries.csv") do |row|
  country = Country.create name: row.first.downcase.strip
end

the_caribbean = Region.find_by(name: "the caribbean")
the_caribbean.countries << Country.find_by(name: "dominican republic")
the_caribbean.countries << Country.find_by(name: "eastern caribbean")
the_caribbean.countries << Country.find_by(name: "jamaica")

africa = Region.find_by(name: "africa")
africa.countries << Country.find_by(name: "botswana")
africa.countries << Country.find_by(name: "burkina faso")
africa.countries << Country.find_by(name: "cameroon")
africa.countries << Country.find_by(name: "cape verde")
africa.countries << Country.find_by(name: "ethiopia")
africa.countries << Country.find_by(name: "ghana")
africa.countries << Country.find_by(name: "guinea")
africa.countries << Country.find_by(name: "kenya")
africa.countries << Country.find_by(name: "lesotho")
africa.countries << Country.find_by(name: "liberia")
africa.countries << Country.find_by(name: "madagascar")
africa.countries << Country.find_by(name: "malawi")
africa.countries << Country.find_by(name: "mali")
africa.countries << Country.find_by(name: "mozambique")
africa.countries << Country.find_by(name: "namibia")
africa.countries << Country.find_by(name: "niger")
africa.countries << Country.find_by(name: "rwanda")
africa.countries << Country.find_by(name: "senegal")
africa.countries << Country.find_by(name: "sierra leone")
africa.countries << Country.find_by(name: "south africa")
africa.countries << Country.find_by(name: "swaziland")
africa.countries << Country.find_by(name: "tanzania")
africa.countries << Country.find_by(name: "the gambia")
africa.countries << Country.find_by(name: "togo")
africa.countries << Country.find_by(name: "uganda")
africa.countries << Country.find_by(name: "zambia")

asia = Region.find_by(name: "asia")
asia.countries << Country.find_by(name: "cambodia")
asia.countries << Country.find_by(name: "china")
asia.countries << Country.find_by(name: "indonesia")
asia.countries << Country.find_by(name: "mongolia")
asia.countries << Country.find_by(name: "nepal")
asia.countries << Country.find_by(name: "philippines")
asia.countries << Country.find_by(name: "thailand")

central_america_and_mexico = Region.find_by(name: "central america & mexico")
central_america_and_mexico.countries << Country.find_by(name: "belize")
central_america_and_mexico.countries << Country.find_by(name: "costa rica")
central_america_and_mexico.countries << Country.find_by(name: "el salvador")
central_america_and_mexico.countries << Country.find_by(name: "guatemala")
central_america_and_mexico.countries << Country.find_by(name: "honduras")
central_america_and_mexico.countries << Country.find_by(name: "mexico")
central_america_and_mexico.countries << Country.find_by(name: "nicaragua")
central_america_and_mexico.countries << Country.find_by(name: "panama")

eastern_europe_and_central_asia = Region.find_by(name: "eastern europe & central asia")
eastern_europe_and_central_asia.countries << Country.find_by(name: "albania")
eastern_europe_and_central_asia.countries << Country.find_by(name: "armenia")
eastern_europe_and_central_asia.countries << Country.find_by(name: "azerbaijan")
eastern_europe_and_central_asia.countries << Country.find_by(name: "georgia")
eastern_europe_and_central_asia.countries << Country.find_by(name: "kyrgyz republic")
eastern_europe_and_central_asia.countries << Country.find_by(name: "macedonia")
eastern_europe_and_central_asia.countries << Country.find_by(name: "moldova")
eastern_europe_and_central_asia.countries << Country.find_by(name: "ukraine")

north_africa_and_the_middle_east = Region.find_by(name: "north america & the middle east")
north_africa_and_the_middle_east.countries << Country.find_by(name: "jordan")
north_africa_and_the_middle_east.countries << Country.find_by(name: "morocco")
north_africa_and_the_middle_east.countries << Country.find_by(name: "tunisia")

pacific_islands = Region.find_by(name: "the pacific islands")
pacific_islands.countries << Country.find_by(name: "fiji")
pacific_islands.countries << Country.find_by(name: "micronesia and palau")
pacific_islands.countries << Country.find_by(name: "samoa")
pacific_islands.countries << Country.find_by(name: "tonga")
pacific_islands.countries << Country.find_by(name: "vanuatu")

south_america = Region.find_by(name: "south america")
south_america.countries << Country.find_by(name: "colombia")
south_america.countries << Country.find_by(name: "ecuador")
south_america.countries << Country.find_by(name: "guyana")
south_america.countries << Country.find_by(name: "paraguay")
south_america.countries << Country.find_by(name: "peru")




print "Creating Jobs"
Spreadsheet.client_encoding = 'UTF-8'

file = File.join(Rails.root, 'db', 'jobs.xls')
book = Spreadsheet.open file
sheet1 = book.worksheet 0

sheet1.each_with_index do |line, i|
	break if line == []

	print i += 1
	sector = line[4]

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

	country_name = line[5].downcase
	country_id = Country.find_by_name(country_name).id unless Country.find_by_name(country_name).nil?

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
		:title => title,
		:need => (1..20).to_a.sample
	)

	job.update sector: Sector.find(sector_id)
end
