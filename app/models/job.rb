class Job < ActiveRecord::Base
  belongs_to :country
  belongs_to :sector

  def self.filter(sector, region)
    return all unless (sector && region)

    sector_jobs = sector.jobs
    region_jobs = region.jobs
    sector_jobs - region_jobs
  end
end
