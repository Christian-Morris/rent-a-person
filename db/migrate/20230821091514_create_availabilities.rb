class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.date :from_date
      t.date :to_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
