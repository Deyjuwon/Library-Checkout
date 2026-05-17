class Book
  attr_reader :title, :author
  attr_accessor :available

  def initialize(title, author)
    @title = title
    @author = author
    @available = true
  end

  def borrow
    return false unless available

    self.available = false
    true
  end

  def return_book
    self.available = true
  end
end
