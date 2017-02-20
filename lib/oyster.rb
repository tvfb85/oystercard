class Oystercard

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(money)
    @balance += (money)
  end

attr_reader :balance

end
