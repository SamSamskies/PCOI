class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :application_deadline
      t.string :departure_date
      t.string :description
      t.string :notification_date
      t.integer :open_positions
      t.text :physical_requirements
      t.integer :quarter
      t.text :skills
      t.text :title
      t.string :year

      t.belongs_to :country
      t.belongs_to :sector
      t.timestamps
    end
  end
end
