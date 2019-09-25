class JourneyLog

  attr_reader :journeys
  
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

  private

  def current_journey(entry,exit)
    Journey.new(entry,exit)
  end

end
