class Employee < ApplicationRecord
  has_many :vacation_ranges, dependent: :destroy
  after_initialize :init_defaults
  validates :name, presence: {message: "O nome deve ser preenchido."}
  validates :role, presence: {message: "O cargo deve ser preenchido."}

  def init_defaults
    self.vacation_days ||=0
    self.active ||=true
    self.hired_in ||=DateTime.current
  end

  def vacation_eligible?
    (Date.today - hired_in).to_i >= 365 && vacation_days >= 10
  end


end
