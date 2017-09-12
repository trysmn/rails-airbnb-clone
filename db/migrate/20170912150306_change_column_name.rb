class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :flats, :max_guest, :max_guests
  end
end
