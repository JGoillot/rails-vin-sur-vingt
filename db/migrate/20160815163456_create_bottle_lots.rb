class CreateBottleLots < ActiveRecord::Migration[5.0]
  def change
    create_table :bottle_lots do |t|
      t.string :dimension
      t.integer :year
      t.string :color
      t.string :appelation
      t.integer :quantity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
