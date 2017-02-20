class Oystercard

LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(money)
    message = "Maximum balance of £#{LIMIT} exceeded"
    raise message if (balance + money > LIMIT )
    @balance += (money)
  end

  def deduct(money)
    @balance -= money
  end

attr_reader :balance

end
