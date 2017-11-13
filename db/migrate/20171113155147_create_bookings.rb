class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :total_price
      t.integer :start_date
      t.integer :end_date
      t.references :user, foreign_key: true
      t.references :family, foreign_key: true
      t.text :review_from_owner
      t.text :review_from_customer

      t.timestamps
    end
  end
end
