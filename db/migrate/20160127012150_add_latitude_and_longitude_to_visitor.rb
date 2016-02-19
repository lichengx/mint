class AddLatitudeAndLongitudeToVisitor < ActiveRecord::Migration
  def change
    add_column :visitors, :latitude, :float
    add_column :visitors, :longitude, :float
  end
end
