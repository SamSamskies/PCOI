class JobsController < ApplicationController
  def index
    sector_jobs = Sector.find(params[:sector_id]).jobs
    region_jobs = Region.find(params[:region_id]).jobs
    @jobs = sector_jobs - region_jobs
  end
end

# sector
# region
