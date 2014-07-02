class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vehicle
      t.date :date
      t.string :desc
      t.integer :mileage
      t.string :category
      t.float :cost

      t.timestamps
    end
  end
end
