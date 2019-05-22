require_relative "../lib/transfer"
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @status = 'pending'
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      return true 
    else 
      return false 
    end
  end
  
  def execute_transaction
    if @status == "complete"
      puts "Transaction was already excuted"
    elsif @sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else 
      sender.withdraw(@amount)
      receiver.deposit(@amount)
      @status = "complete"
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      sender.deposit(@amount)
      receiver.withdraw(@amount)
      @status = "reversed"
    else
      "Transaction was not executed. It cannot be reversed"
    end
  end
end
