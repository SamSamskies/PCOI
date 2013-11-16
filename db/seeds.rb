require 'csv'

regions = ["the caribbean", "central america & mexico", "south america", "eastern europe & central asia", "asia", "north america & the middle east", "africa", "the pacific islands" ]

sectors = ["education", "health", "community economic development", "environment", "youth in development", "agriculture", "other"]

regions.each do |region|
  Region.create name: region
end

region_ids = Region.pluck :id

sectors.each do |sector|
  sector = Sector.create name: sector
end

sector_ids = Sector.pluck :id

CSV.foreach("./db/countries.csv") do |row|
  country = Country.create name: row.first.strip, region_id: region_ids.sample

  4.times do
    country.sectors << Sector.find(sector_ids.sample)
  end
end

400.times do
  Job.create title: Faker::Lorem.sentence, sector_id: sector_ids.sample
end
