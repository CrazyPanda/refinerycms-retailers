class AddCountyToRetailers < ActiveRecord::Migration
  def change
    add_column :refinery_retailers, :county, :string
  end
end