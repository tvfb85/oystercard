require_relative 'journey'

class Journeylog

  attr_reader :fare, :current_journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @history = []
  end

  def start(entry_station = nil)
    @current_journey = journey_class.new(entry_station)
  end

  def finish(exit_station = nil)
    @fare = current_journey?.set_exit(exit_station)
    @history << @current_journey
    @current_journey = nil
  end

  def journeys
    @history.dup
  end


private

  attr_reader :history, :journey_class

  def current_journey?
    @current_journey ||= journey_class.new
  end

end
