class FeeCalculator
  DAILY_FINE = 2

  def calculate(loan)
    loan.days_late * DAILY_FINE
  end
end
