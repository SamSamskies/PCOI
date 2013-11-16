class CreateCountriesSectors < ActiveRecord::Migration
  def change
    create_table :countries_sectors do |t|
      t.belongs_to :country
      t.belongs_to :sector
    end
  end
end
