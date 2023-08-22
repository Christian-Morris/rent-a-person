class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :age
      t.string :email
      t.string :gender
      t.string :location

      t.timestamps
    end
  end
end
