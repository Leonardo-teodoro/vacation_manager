class VacationDaysJob
  include Sidekiq::Job

  def perform(*args)
    puts "Pesquisando todos os funcionários..."
    employees = Employee.all
    employees.each do |employee|
      if (Date.today - employee.hired_in).to_i % 365 == 0
        employee.update(vacation_days: employee.vacation_days + 30)
        puts "Funcionário "+ employee.name + " recebeu +30 dias disponíveis para férias!"
      end
    end

    puts "Fim."
  end
end
