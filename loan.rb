class Loan
  attr_reader :book, :member, :borrowed_date, :due_date
  attr_accessor :returned_date

  def initialize(book, member, borrowed_date, due_date)
    @book = book
    @member = member
    @borrowed_date = borrowed_date
    @due_date = due_date
    @returned_date = nil
  end

  def overdue?
    returned_date && returned_date > due_date
  end

  def days_late
    return 0 unless overdue?

    (returned_date - due_date).to_i
  end
end
