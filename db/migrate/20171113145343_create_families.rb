class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :name
      t.string :address
      t.integer :price_per_day
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
