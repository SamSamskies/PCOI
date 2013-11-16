regions = ["the caribbean", "central america & mexico", "south america", "eastern europe & central asia", "asia", "north america & the middle east", "africa", "the pacific islands" ]

sectors = ["education", "health", "community economic development", "environment", "youth in development", "agriculture", "other"]

regions.each do |region|
  Region.create name: region
end

sectors.each do |sector|
  Sector.create name: sector
end

