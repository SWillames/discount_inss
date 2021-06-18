class CalculatorService
  def initialize(salary)
    @salary = salary
  end

  def execute!
    calculator(@salary)
  end

  def calculator(salary)
    return 0 if @salary.blank?
    contribution = 0
    if salary <= 1045
      contribution = @salary * 0.075
    elsif salary <= 2089.6
      contribution = (@salary - 1045) * 0.09
    elsif salary <= 3134.4
      contribution = (@salary - 2089.6) * 0.12
    elsif salary <= 6101.06
      contribution = (@salary - 3134.4) * 0.14
    else
      contribution = 0
    end
    contribution.to_d.truncate(2).to_f
  end
end