class Journey

MINIMUM_FARE = 2
PENALTY_FARE = 6

  attr_accessor :entry_station, :exit_station, :fare, :journey

  def initialize(entry_station = nil)
    @entry_station = entry_station
  end

  def set_exit(exit_station = nil)
    journey_complete?
    @exit_station = exit_station
    # @journey = { :entry_station => entry_station, :exit_station => exit_station }
    fare
  end

  #
  # def in_journey?
  #   !!@entry_station
  # end

  def fare
    @fare = journey_complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def journey_complete?
    !!(entry_station && exit_station)
  end

end
