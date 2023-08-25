class DropBookedDate < ActiveRecord::Migration[7.0]
  def change
    drop_table :booked_dates
  end
end
