class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status 

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender 
    @receiver = receiver
    @amount = amount 
  end
  
  def valid? 
    @sender.valid? && @receiver.valid? ? true: false
  end
  
  def execute_transaction 
    if valid? && @status = "pending" && @sender.balance >= amount
      @status = "completed"
      @sender.balance -= @amount 
      @receiver.balance += @amount 
    end 
  end
end
