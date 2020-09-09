class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains.push(train)
  end

  def type_of_train(type)
    @trains.each {|train| puts train }
  end

  def sent_train(train_type)
    @trains.delete(train_type)
  end
end 

