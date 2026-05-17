require_relative 'book'
require_relative 'member'
require_relative 'loan'
require_relative 'library'
require_relative 'fee_calculator'
require_relative 'email_notification'
require 'date'

fee_calculator = FeeCalculator.new
notification_service = EmailNotification.new

library = Library.new(fee_calculator, notification_service)

book = Book.new('Clean Code', 'Robert C. Martin')
member = Member.new('Alice')

library.add_book(book)
library.borrow_book(book, member)

loan = member.loans.first
library.return_book(loan, Date.today + 18)
