class Job < ActiveRecord::Base
  belongs_to :country
  belongs_to :sector
end
