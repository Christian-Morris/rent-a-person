class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :occasion, null: false, foreign_key: true
      t.references :escort, null: false, foreign_key: { to_table: :users }
      t.references :renter, null: false, foreign_key: { to_table: :users }
      t.date :start_date
      t.date :end_date
      t.string :location

      t.timestamps
    end
  end
end
