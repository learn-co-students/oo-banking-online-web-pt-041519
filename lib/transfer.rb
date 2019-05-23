class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  # Return true if sender and receiver are valid
  def valid?
    @sender.valid? && @receiver.valid?
  end

  # If accounts are valid, remove from sender balance, add to receiver balance, and update status. Else inform rejection and update status.
  def execute_transaction
    if valid? && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.deposit(@amount) 
      @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  # If status is "complete" and accounts are valid, reverse last transfer.
  def reverse_transfer
    if valid? && @status == "complete" && @sender.balance > @amount
      @sender.deposit(@amount)
      @receiver.balance -= @amount
      @status = "reversed"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end