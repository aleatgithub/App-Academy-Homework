require_relative "player"



class Game
  attr_reader :fragment, :words, :cur_dictionary


def create_dictionary
    @words = []
    File.open("dictionary.txt").each { |line| @words << line}
    @cur_dictionary = {}
    alpha = ("a".."z").to_a.each do |char|
        @cur_dictionary[char] = @words.select { |word| word.start_with?(char)}
    end 
  end 

  def initialize(player_1,player_2)
    @fragment = ""
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @previous_player = @player_2
    self.create_dictionary
  end
  
  def valid_play?(string)
    @cur_dictionary[string[0]].any? { |word| word.start_with?(string) }
  end 

  def valid_word?(string)
    string += "\n"
    @cur_dictionary[string[0]].include?(string)
    # puts @cur_dictionary[string[0]] ``
  end

  def turn
    puts @fragment
    last_char = @current_player.get_guess 
    guess = @fragment + last_char
    if valid_play?(guess)
        @fragment += last_char
        switch_turns
    else 
        puts "No words begin with guess"
        switch_turns
    end 
  end

  def switch_turns
    if @current_player == @player_1 
      @current_player = @player_2
      @previous_player = @player_1
    else
      @current_player = @player_1
      @previous_player = @player_2
    end
  end 

  def play_round
    while  @fragment.length == 0 || valid_word?(@fragment) == false 
      turn 
    end
      @previous_player.strikes += 1
      @fragment = ""
      if @previous_player.strikes < 5 
        play_round
      else 
        puts "#{@previous_player.name} has lost"
      end 
  end

  def play_game
    while @previous_player.strikes == 5
      play_round
    end
  end


  # need a way to determine when we've won a round 
  # - fragment is equal to some word in the dictionary 
  # need a way to keep track of losses and wins to determine overall winner
  # - adding a letter from string GHOST to each player's "record"
  # - run game until either player reaches 5 losses
  # add scoreboard


end



 player_1 = Player.new("ale")
 player_2 = Player.new("theo")
 ghost = Game.new(player_1,player_2)
 ghost.play_round
 # player_2.strikes
 # ghost.valid_play?("auto\n")