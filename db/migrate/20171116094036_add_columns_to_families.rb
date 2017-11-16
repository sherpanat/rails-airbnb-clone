class AddColumnsToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :members, :integer
    add_column :families, :pension, :string
    add_column :families, :churchgoer, :boolean
    add_column :families, :swinger, :boolean
  end
end
