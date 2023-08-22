class CreateUserOccasions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_occasions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :occasion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
