class Region < ActiveRecord::Base
  has_many :countries

  def jobs
    self.countries.map { |country| country.jobs }.flatten
  end
end
