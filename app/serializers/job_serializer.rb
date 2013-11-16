class JobSerializer < ActiveModel::Serializer
  attributes :application_deadline, :departure_date, :description, :notification_date, :open_positions, :physical_requirements, :quarter, :physical_requirements, :quarter, :skills, :title, :year
end