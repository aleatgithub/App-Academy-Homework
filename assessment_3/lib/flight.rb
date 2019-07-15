class Flight

  attr_reader :passengers

  def initialize(flight_num_str, capacity_num)
    @flight_number = flight_num_str
    @capacity = capacity_num
    @passengers = []
  end

  def full?
    self.passengers.length >= @capacity
  end

  def board_passenger(person)
    return false if self.full?
    @passengers << person if person.has_flight?(@flight_number)
  end

  def list_passengers
    arr = @passengers.map {|person| person.name }
    p arr
  end

  def [](number)
    @passengers[number]
  end

  def <<(person)
    self.board_passenger(person)
  end



end