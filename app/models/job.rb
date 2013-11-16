class Job < ActiveRecord::Base
  belongs_to :country
  belongs_to :sector

  def self.filter(sector, region)
    return all.order(:need) if sector.nil? && region.nil?

    sector_jobs = sector.jobs if sector
    return sector_jobs.sort { |job1, job2| job1.need <=> job2.need } if sector && region.nil?

    region_jobs = region.jobs if region
    return region.jobs.sort { |job1, job2| job1.need <=> job2.need } if region && sector.nil?

    (sector_jobs - region_jobs).sort { |job1, job2| job1.need <=> job2.need }
  end

end
