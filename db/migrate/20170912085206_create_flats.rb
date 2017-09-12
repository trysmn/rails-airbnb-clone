class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :title
      t.string :address_line
      t.string :postal_code
      t.string :city
      t.string :country
      t.string :pictures
      t.integer :max_guest
      t.integer :price
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
