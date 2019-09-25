class JourneyLog

  attr_reader :entry_station

  def initialize
    @journeys = []
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @journeys << current_journey(@entry_station, station)
    @entry_station = nil
  end

  def journey_history
    @journeys.dup
  end

  private

  def current_journey(entry,exit)
    Journey.new(entry,exit)
  end

end
