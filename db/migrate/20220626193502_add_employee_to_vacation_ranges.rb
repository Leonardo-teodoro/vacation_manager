class AddEmployeeToVacationRanges < ActiveRecord::Migration[7.0]
  def change
    add_reference :vacation_ranges, :employee, null: false, foreign_key: true
  end
end
