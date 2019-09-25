class Journey

MIN_FARE = 1
PENALTY_FARE = 6

  def initialize(entry_station,exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
    return PENALTY_FARE if (@entry_station==nil)||(@exit_station==nil)
    calculate_fare
  end

  private

  def calculate_fare
    zone_difference = (@entry_station.zone - @exit_station.zone).abs
    return zone_difference+MIN_FARE
  end

end
