class Country < ActiveRecord::Base
  belongs_to :region
  has_many :jobs
end
