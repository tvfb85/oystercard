class Oystercard

LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(money)
    message = "Maximum balance of £#{LIMIT} exceeded"
    raise message if (balance + money > LIMIT )
    @balance += (money)
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    raise "Card already in journey" if in_journey?
    @in_journey = true
  end

  def touch_out
    raise "Card is not in a journey" unless in_journey?
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

attr_reader :balance

end
