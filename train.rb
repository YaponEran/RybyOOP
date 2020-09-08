class Train
  attr_reader :number, :type, :amount_vagon
  attr_accessor :speed

  def inittialize(number, type, amount_vagon)
    @number = number
    @type = type
    @amount_vagon = amount_vagon
    @speed = 0
  end

  def train_speed(speed)
    @speed += speed
  end

  def train_stop
    @speed = 0
  end

  def delete_vagon
    @amount_vagon -= 1 if @speed == 0 && @amount_vagon > 0
  end

  def add_vagon
    @amount_vagon += 1 if @speed == 0
  end

  def add_route(route)
    @route = route
    @route.start_station.add_station(self)
    @stations = route.start_station
  end

  def move_station
    return if end_station?
  end

  def comeback_station
    return if start_station?
  end

  def next_station
    @route.stations[stations_index + 1] unless end_station?
  end

  def prev_station
    @route.stations[stations_index - 1] unless start_station?
  end

  def stations_index
    @route.stations.index(@stations)
  end

  def end_station?
    @stations == @route.end_station?
  end

  def start_station?
    stations_index == 0
  end
end 