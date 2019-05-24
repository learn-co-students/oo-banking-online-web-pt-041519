class BankAccount
attr_reader  :status, :name
attr_accessor :balance

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit
  end

  def display_balance
    "Your balance is $#{Self.balance}."
  end

  def valid?
    if @status = "open" && @balance > 0
      valid
    else
      invalid
    end
  end





end
