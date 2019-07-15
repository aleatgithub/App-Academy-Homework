class Passenger

  attr_reader :name

  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(flight_num_str)
    new_arr = flight_num_str.split("").map{|char| char.upcase}
    if @flight_numbers.include?(new_arr.join(""))
      return true
    else
      return false
    end
  end


  def add_flight(flight_num_str)
  new_arr = flight_num_str.split("").map{|char| char.upcase}
    if !has_flight?(flight_num_str)
      @flight_numbers << new_arr.join("")
    end
  end
end

