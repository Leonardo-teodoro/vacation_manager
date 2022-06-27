class VacationRange < ApplicationRecord

  validate :validate_vacation_range_days, :validate_vacation_overlap, :validate_start_date, :validate_end_date

  after_touch do |vacation_range|
    old_days_count = vacation_range.employee.vacation_days
    vacation_range.employee.update(vacation_days: old_days_count - range_in_days)
  end
  belongs_to :employee

  def range_duration_less_than_or_equal(number_of_days)
    range_in_days <= number_of_days
  end

  def range_in_days
    !end_date.nil? && !start_date.nil? ? (end_date-start_date).to_i : 0
  end

  def validate_vacation_range_days
    if range_duration_less_than_or_equal(9)
      errors.add("O período de férias", "não pode ser menor que 10 dias.")
    end
    if !start_date.nil? && !employee.try(:vacation_days).nil? && !range_duration_less_than_or_equal(employee.vacation_days)
      errors.add("O funcionário", "só possui " + employee.vacation_days.to_s + " dias para férias. Selecione um período mais curto.")
    end
  end


  def validate_vacation_overlap
    unless employee.try(:vacation_ranges).nil? || start_date.nil? || end_date.nil?
      self.employee.vacation_ranges.each do |vacation_range|
        if vacation_range.start_date <= self.end_date && self.start_date <= vacation_range.end_date
          errors.add("O período de férias", "não englobar outro período já cadastrado")
        end
      end
    end
  end


  def validate_start_date
    
    if !start_date.nil?
      if Date.today >= start_date
        errors.add("O período de férias", "não pode começar em uma data anterior à atual.")
      elsif !end_date.nil? && start_date > end_date
        errors.add("A data inicial", "não pode ser maior do que a final.")
      elsif !end_date.nil? && start_date == end_date
        errors.add("A data inicial", "não pode ser igual a final.")
      end
    else
      errors.add("A data inicial", "deve ser preenchida.")
    end
  end
  def validate_end_date
    
    if !end_date.nil?
      elsif !start_date.nil? && end_date < start_date
        errors.add("A data final", "não pode ser menor do que a inicial.")
    else
      errors.add("A data final", "deve ser preenchida.")
    end
  end

end
