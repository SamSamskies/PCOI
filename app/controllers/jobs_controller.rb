class JobsController < ApplicationController
  def index
    @filtered_jobs = Job.filter(Sector.find(params[:sector_id]), Region.find(params[:region_id]))
  end
end
