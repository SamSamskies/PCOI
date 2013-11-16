class Sector < ActiveRecord::Base
  belongs_to :country
  has_many :jobs
end
