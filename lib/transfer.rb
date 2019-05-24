class Transfer

  attr_reader :status
  attr_accessor :sender, :amount, :receiver

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
    if sender.valid? && receiver.valid? && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      "Transaction rejected. Please check your account balance."
    end
  end


end
