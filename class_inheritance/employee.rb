class Employee

  attr_reader :title, :salary, :boss
  
  def initialize(title, salary, boss)
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @bonus = salary * multiplier
  end

end

class Manager < Employee

  attr_reader :employees

  def initialize(title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    @bonus = employees.map { |employee| employee.bonus(1) }.sum
  end

  def add_employee(employee)
    self.employees << employee
  end

end

if $PROGRAM_NAME == __FILE__

  ned = Manager.new("Founder", 1000000, nil)
  darren = Manager.new("TA Manager", 78000, ned)
  shawna = Employee.new("TA", 12000, darren)
  david = Employee.new("TA", 10000, darren)
  ned.add_employee(darren)
  darren.add_employee(shawna)
  darren.add_employee(david)

  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000

end