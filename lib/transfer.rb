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
  
  end


end
