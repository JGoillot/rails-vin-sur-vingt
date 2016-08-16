class CreateCellars < ActiveRecord::Migration[5.0]
  def change
    create_table :cellars do |t|
      t.text :description
      t.string :address
      t.integer :space_available
      t.integer :price_per_month
      t.string :kind
      t.integer :temperature
      t.string :open_hour
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
