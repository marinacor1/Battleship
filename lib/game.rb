require_relative 'player_prompt'
require_relative 'computer_play'

class Game
  attr_reader :shot, :player_setup, :computer_setup, :computer_guess

  def initialize(player_initial_ship_setup, computer_initial_setup)
    binding.pry
    @player_ships = player_initial_ship_setup
    @computer_ships = computer_initial_setup
    @player_hits = 0
    @computer_hits = 0
  end


  def hit_or_miss(player_shot)
    if @computer_ships.include?(player_shot)
      @player_hits +=1
      add_hit_to_map
    else
      add_miss_to_map
    end
  end

  def add_hit_to_map

  end

  def add_miss_to_map
  end

end
