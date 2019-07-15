class Player

  attr_reader :name
  attr_accessor :strikes

  def initialize(name)
    @name = name
    @strikes = 0
  end

  def get_guess
    puts "Enter a guess"
    input = gets.chomp 
    raise "Invalid guess" if !("a".."z").to_a.include?(input) 
    input
  end
end


#player_1 = Player.new
#player_1.get_guess 

words = []

File.open("dictionary.txt").each { |line| words << line}

cur_dictionary = {}

alpha = ("a".."z").to_a.each do |char|
    cur_dictionary[char] = words.select { |word| word.start_with?(char)}
end 