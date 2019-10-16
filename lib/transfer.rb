class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status 

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender 
    @receiver = receiver
    @amount = amount 
  end
end
