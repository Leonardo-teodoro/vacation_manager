class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :role
      t.date :hired_in
      t.integer :vacation_days
      t.boolean :active

      t.timestamps
    end
  end
end
