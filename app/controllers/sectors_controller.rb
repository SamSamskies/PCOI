class SectorsController < ApplicationController
  def show
    @sector = Sector.find(params[:id])
  end
end