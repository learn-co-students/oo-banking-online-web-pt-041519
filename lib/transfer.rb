class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount
  attr_reader :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"  #always initializes with a status of 'pending'
  end


  def valid?
     sender.valid? && receiver.valid? #can check that both accounts are valid
  end

  def execute_transaction
    if valid? && @status == "pending"
    sender.balance -= amount #150 - 50 = 100
    receiver.balance += amount #10 + 50 = 150
    @status = "complete"
    end
    unless valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && @status == "complete"
    sender.balance += amount #950 - 50 = 1000
    receiver.balance -= amount
    @status = "reversed"
    end
  end

end
