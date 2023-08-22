class ChangeTypeToNameForOccasions < ActiveRecord::Migration[7.0]
  def change
    change_table :occasions do |t|
      t.rename :type, :name
    end
  end
end
