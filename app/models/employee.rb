# @param name [String] Name of the employee
# @param role [String] Role of the employee
# @param hired_in [Date] Hiring date
# @param vacation_days [Integer] Available number of days to register vacation ranges
# @param active [Boolean] Indicates if a employee is active or not
# @param vacation_ranges [Array<VacationRange>] List of all vacation ranges associated with the employee
class Employee < ApplicationRecord

  has_many :vacation_ranges, dependent: :destroy
  after_initialize :init_defaults
  validates :name, presence: {message: "O nome deve ser preenchido."}
  validates :role, presence: {message: "O cargo deve ser preenchido."}
  
  # Init an object of Employee with default configuration
  # @return [Employee]
  def init_defaults
    self.vacation_days ||=0
    self.active ||=true
    self.hired_in ||=DateTime.current
    self
  end

  # Check if the employee is eligible to register vacations
  # @param hired_in [Date]
  # @param vacation_days [Integer]
  # @return [Boolean]
  def vacation_eligible?
    (Date.today - hired_in).to_i >= 365 && vacation_days >= 10
  end


end
