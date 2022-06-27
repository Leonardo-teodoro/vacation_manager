class CreateVacationRanges < ActiveRecord::Migration[7.0]
  def change
    create_table :vacation_ranges do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
