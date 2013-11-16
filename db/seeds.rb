require 'csv'

regions = ["the caribbean", "central america & mexico", "south america", "eastern europe & central asia", "asia", "north america & the middle east", "africa", "the pacific islands" ]

sectors = ["education", "health", "community economic development", "environment", "youth in development", "agriculture", "other"]

regions.each do |region|
  Region.create name: region
end

region_ids = Region.pluck :id

CSV.foreach("./db/countries.csv") do |row|
  Country.create name: row.first.strip, region_id: region_ids.sample
end

country_ids = Country.pluck :id

sectors.each do |sector|
  Sector.create name: sector, country_id: country_ids.sample
end

sector_ids = Sector.pluck :id

400.times do
  Job.create title: Faker::Lorem.sentence, sector_id: sector_ids.sample
end
