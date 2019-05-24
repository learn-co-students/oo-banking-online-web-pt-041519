class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  attr_writer :deposit

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"

  end

  def deposit(money) #can deposit money into its account
    @balance += money   #add it to the balance
  end

  def display_balance # can display its balance
    "Your balance is $#{@balance}."
  end

  def valid? # boolean
     status == "open" && balance > 0 # valid with an open status and a balance greater than 0
  end

  def close_account
    @status = "closed"
  end


end
