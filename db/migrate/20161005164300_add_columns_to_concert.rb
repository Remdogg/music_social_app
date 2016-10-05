class AddColumnsToConcert < ActiveRecord::Migration
  def change
    add_column :concerts, :latitude, :float
    add_column :concerts, :longitude, :float
    add_column :concerts, :address, :string
  end
end
