class AddCoordinatesToCellars < ActiveRecord::Migration[5.0]
  def change
    add_column :cellars, :latitude, :float
    add_column :cellars, :longitude, :float
  end
end
