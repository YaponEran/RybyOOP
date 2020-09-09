class Train
  attr_accessor :speed, :station, :num_of_vagons, :route
  attr_reader :number, :type

  def initialize(number, type, num_of_vagons)
    @number = number
    @type = type
    @num_of_vagons = num_of_vagons
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def add_vagon
    self.num_of_vagons += 1 if speed == 0
  end

  def remove_vagon
    self.num_of_vagons -= 1 if speed == 0 & num_of_vagons > 0
  end

  def add_route(route)
    self.route = route
    self.station = route.start_station
    station.add_train(self)
  end

  def move_station
    if station != route.end_station
      station.send_train(self)
      self.station = self.next_station
      station.add_train(self)
    end
  end

  def comeback_station
    if station != route.start_station
      station.send_train(self)
      self.station = self.previous_station
      station.add_train(self)
    end
  end

  def next_station
    route.stations[route.stations.index(station) + 1]
  end

  def previous_station
    if station == route.start_station
      nil
    else
      route.stations[route.stations.index(station) - 1]
    end
  end
end