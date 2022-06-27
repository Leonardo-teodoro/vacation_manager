class VacationDaysJob
  include Sidekiq::Job

  def perform(*args)
    puts "Pesquisando todos os funcionários..."
    employees = Employee.all
    employees.each do |employee|
      if Date.today.years_ago(1) == employee.hired_in
        employee.update(vacation_days: employee.vacation_days + 30)
        puts "Funcionário "+ employee.name + " recebeu +30 dias disponíveis para férias!"
      end
    end

    puts "Fim."
  end
end
