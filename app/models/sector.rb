class Sector < ActiveRecord::Base
  has_and_belongs_to_many :countries

  def jobs
    self.countries.map { |country| country.jobs }.flatten
  end
end
