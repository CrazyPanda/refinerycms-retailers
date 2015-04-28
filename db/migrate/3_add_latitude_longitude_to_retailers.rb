class AddLatitudeLongitudeToRetailers < ActiveRecord::Migration
  def change
    add_column :refinery_retailers, :latitude, :float
    add_column :refinery_retailers, :longitude, :float
  end
end