class Route
  attr_reader :start_station, :end_station, :stations

  def inittialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [start_station, end_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
    puts "Train was insert!"
  end

  def delte_station(station)
    @station.delete(station)
  end
end 