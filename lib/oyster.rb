class Oystercard

  DEFAULT_BALANCE = 0
  MIN_BALANCE = 1
  MAX_BALANCE = 90
  TRAVEL_COST = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    message = "Maximum balance of £#{MAX_BALANCE} exceeded"
    raise message if (balance + amount > MAX_BALANCE )
    @balance += (amount)
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    raise "Card already in journey" if in_journey?
    raise "Insufficient funds on card" unless sufficient_funds?
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    raise "Card is not in a journey" unless in_journey?
    deduct(TRAVEL_COST)
    @exit_station = exit_station
    @journey = { :entry_station => entry_station, :exit_station => exit_station }
    @journeys << @journey
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
