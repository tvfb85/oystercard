class Oystercard
MIN_BALANCE = 1
MAX_BALANCE = 90
TRAVEL_COST = 1
attr_reader :balance, :entry_station

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    message = "Maximum balance of £#{MAX_BALANCE} exceeded"
    raise message if (balance + amount > MAX_BALANCE )
    @balance += (amount)
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station = nil)
    raise "Card already in journey" if in_journey?
    raise "Insufficient funds on card" unless sufficient_funds?
    @entry_station = entry_station
  end

  def touch_out
    raise "Card is not in a journey" unless in_journey?
    deduct(TRAVEL_COST)
    @entry_station = nil
  end

private

  def deduct(amount)
    @balance -= amount
  end

  def sufficient_funds?
    @balance >= MIN_BALANCE
  end

end
