class Transfer

  attr_reader :status
  attr_accessor :sender, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end




end
