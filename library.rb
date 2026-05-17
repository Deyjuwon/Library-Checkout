require 'date'

class Library
  def initialize(fee_calculator, notification_service)
    @books = []
    @loans = []
    @fee_calculator = fee_calculator
    @notification_service = notification_service
  end

  def add_book(book)
    @books << book
  end

  def borrow_book(book, member)
    unless book.borrow
      puts "#{book.title} is not available."
      return
    end

    loan = Loan.new(book, member, Date.today, Date.today + 14)
    @loans << loan
    member.add_loan(loan)

    @notification_service.send_message(
      member,
      "You borrowed '#{book.title}'. Please return it by #{loan.due_date}."
    )
  end

  def return_book(loan, return_date = Date.today)
    loan.returned_date = return_date
    loan.book.return_book

    fine = @fee_calculator.calculate(loan)

    if fine.positive?
      puts "Book returned late. Fine: $#{fine}"
    else
      puts 'Book returned on time.'
    end
  end
end
