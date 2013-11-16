class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.integer :sector_id

      t.timestamps
    end
  end
end
