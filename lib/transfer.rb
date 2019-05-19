# acts as a space for a transaction between two instances
# of the bank account class
# transfer instances will run checks before transfers occur
# transfer instances will check the validity of the accounts
# before the transaction occurs
# transfer instances should be able to reject a Transfer
# if the accounts aren't valid / sender has no money
# transfer start in pending status
# they can be executed and go to complete status
# or rejected
# a completed transfer can also be reversed
require 'pry'
class Transfer
    attr_reader :sender, :receiver
    attr_accessor :status, :amount
    
    def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    end
    
    def valid?
      @sender.valid? && @receiver.valid?
    end
    
    def execute_transaction
      if status == "pending" && valid? == true
        @sender.balance = @sender.balance - @amount
          if @sender.balance < 0
            @status = "rejected"
            return "Transaction rejected. Please check your account balance."
          end
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
      end
    end
    
    def reverse_transfer
      self.execute_transaction
        if @status = "complete"
          @sender.balance = @sender.balance + @amount
          @receiver.balance = @receiver.balance - @amount
          @status = "reversed"
        end
    end

end
