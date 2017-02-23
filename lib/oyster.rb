require_relative 'station'
require_relative 'journeylog'

class Oystercard

  DEFAULT_BALANCE = 0
  MIN_BALANCE = 1
  MAX_BALANCE = 90

  attr_reader :balance, :journeylog

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeylog = Journeylog.new
  end

  def top_up(amount)
    message = "Maximum balance of £#{MAX_BALANCE} exceeded"
    raise message if (balance + amount > MAX_BALANCE )
    @balance += (amount)
  end

  def touch_in(entry_station)
    raise "Insufficient funds on card" unless sufficient_funds?
    raise "Card already in use" if card_in_use?
    @journeylog.start(entry_station)
  end

  def touch_out(exit_station)
    @journeylog.finish(exit_station)
    deduct(@journeylog.fare)
  end

  private

  def card_in_use?
    @journeylog.current_journey
  end

  def deduct(amount)
    @balance -= amount
  end

  def sufficient_funds?
    @balance >= MIN_BALANCE
  end

end
