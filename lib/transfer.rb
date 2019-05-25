class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == "pending" && @sender.balance > self.amount
      @sender.balance = @sender.balance - self.amount
      @receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
      if self.status == "complete"
        @receiver.balance = @receiver.balance - self.amount
        @sender.deposit(self.amount)
        self.status = "reversed"
      end
    end

  end
  # your code here
end
