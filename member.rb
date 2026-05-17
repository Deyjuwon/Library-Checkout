class Member
  attr_reader :name, :loans

  def initialize(name)
    @name = name
    @loans = []
  end

  def add_loan(loan)
    loans << loan
  end
end
