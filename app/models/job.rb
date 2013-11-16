class Job < ActiveRecord::Base
  belongs_to :country
  belongs_to :sector

  def self.filter(sector, region)
    if sector && region.nil?
      return sector.jobs

    elsif region && sector.nil?
      return region.jobs

    elsif sector.nil? && region.nil?
      return all

    sector_jobs - region_jobs
  end
end
