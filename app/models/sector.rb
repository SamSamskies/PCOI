class Sector < ActiveRecord::Base
  has_and_belongs_to_many :countries
  has_many :jobs
end
