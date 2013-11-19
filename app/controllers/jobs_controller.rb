class JobsController < ApplicationController
  def index
    @filtered_jobs = Job.filter(Sector.find_by(id: params[:sector_id]), Region.find_by(id: params[:region_id]))
  end

  def show
    @job = Job.find(params[:id])
    render :layout => false
  end
end
