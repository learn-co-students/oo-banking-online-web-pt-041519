class Transfer
  attr_accessor :sender, :amount, :receiver,  :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.valid? && receiver.valid? && sender.balance > @amount && self.status != "complete"

      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
        self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer

  end


end
