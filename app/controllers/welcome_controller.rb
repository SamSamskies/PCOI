class WelcomeController < ApplicationController
  def index
    @regions = Region.all
    @sectors = Sector.all
  end
end
