class AddIndexForUniqunessOnNameCountry < ActiveRecord::Migration
  def change
    add_index :manufacturers, [:name, :country], unique: true
  end
end
