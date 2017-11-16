class ChangeMembersToFamilies < ActiveRecord::Migration[5.1]
  def change
    change_column :families, :members, :string
  end
end
