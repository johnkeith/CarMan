class ChangeManufacturerColumnCarsTable < ActiveRecord::Migration
  def up
    remove_column :cars, :manufacturer, :string, null: false
    add_column :cars, :manufacturer_id, :integer, null: false
  end

  def down
    add_column :cars, :manufacturer, :string, null: false
    remove_column :cars, :manufacturer_id, :integer, null: false
  end
end
