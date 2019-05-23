class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  # Add money to account
  def deposit(money)
    @balance += money
  end

  # Return balance statement
  def display_balance
    return "Your balance is $#{@balance}."
  end

  # Returns true if status is open and balance > 0
  def valid?
    @balance > 0 && @status == "open"
  end

  # Change status to closed
  def close_account
    @status = "closed"
  end

end
