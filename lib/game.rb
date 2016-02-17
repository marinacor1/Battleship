require_relative 'player_prompt'
require_relative 'computer_play'

class Game
  attr_reader :shot, :player_setup, :computer_setup, :computer_guess

  def initialize(player_shot)
    @player_shot = player_shot
    @player_hits = 0
  end

  def map_reading

  end

  def hit_or_miss
    if @computer_setup.include?(@player_shot)
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
