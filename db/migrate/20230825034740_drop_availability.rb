class DropAvailability < ActiveRecord::Migration[7.0]
  def change
    drop_table :availabilities
  end
end
