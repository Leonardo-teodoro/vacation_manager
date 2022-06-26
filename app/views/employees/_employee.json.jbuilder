json.extract! employee, :id, :name, :role, :hired_in, :vacation_days, :active, :created_at, :updated_at
json.url employee_url(employee, format: :json)
