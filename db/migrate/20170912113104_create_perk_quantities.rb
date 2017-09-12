class CreatePerkQuantities < ActiveRecord::Migration[5.0]
  def change
    create_table :perk_quantities do |t|
      t.integer :quantity
      t.references :perk, foreign_key: true
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
