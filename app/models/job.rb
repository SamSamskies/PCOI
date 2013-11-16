class Job < ActiveRecord::Base
  belongs_to :country
  belongs_to :sector

  def self.filter(sector, region)
    return all unless sector && region

    sector_jobs = sector.jobs
    return sector_jobs if sector && region.nil?

    region_jobs = region.jobs
    return region.jobs if region && sector.nil?

    sector_jobs - region_jobs
  end
end
