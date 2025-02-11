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
    if valid? && @status == "pending" && @sender.balance >= amount
      @status = "complete"
      @sender.balance -= @amount 
      @receiver.balance += @amount 
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
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
