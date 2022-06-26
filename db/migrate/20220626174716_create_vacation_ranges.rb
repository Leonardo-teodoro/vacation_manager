class CreateVacationRanges < ActiveRecord::Migration[7.0]
  def change
    create_table :vacation_ranges do |t|
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
