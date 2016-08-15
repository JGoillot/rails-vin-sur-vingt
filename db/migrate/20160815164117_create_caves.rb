class CreateCaves < ActiveRecord::Migration[5.0]
  def change
    create_table :caves do |t|
      t.text :description
      t.string :address
      t.integer :price_per_month
      t.string :type
      t.integer :temperature
      t.string :open_hour
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
