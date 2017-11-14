class UpdateFamiliesTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :families, :address, :city
    add_column :families, :country_origin, :string
    add_column :families, :photo, :binary
  end
end
