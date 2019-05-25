require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(acsender, acreceiver, acamount)
    @sender = acsender
    @receiver = acreceiver
    @status = "pending"
    @amount = acamount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
       @sender.balance  -= @amount
       @receiver.balance += @amount
       @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
