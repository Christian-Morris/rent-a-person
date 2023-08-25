class RemoveEndDateFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :end_date
    rename_column :bookings, :start_date, :date
  end
end
