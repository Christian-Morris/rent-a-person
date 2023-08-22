class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :escort, null: false, foreign_key: { to_table: :users }
      t.references :renter, null: false, foreign_key: { to_table: :users }
      t.string :comment
      t.integer :rating
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
