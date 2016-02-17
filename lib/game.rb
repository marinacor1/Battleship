require_relative 'player_prompt'

class Game
  attr_reader :shot, :a, :b, :c, :d

  def initialize(shot, player_a, player_b, player_c, player_d) #A1
    @shot = shot
    @possible_responses = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @player_a = player_a #X X nil X
    @player_b = player_b
    @player_c = player_c
    @player_d = player_d
  end

  def map_reading

  end

  def hit_or_miss
    if @shot.start_with?("A")
      if@shot[1] ==
      end
    elsif @shot.start_with?("B")

    elsif @shot.start_with?("C")

    else # @shot.start_with?("D")
    end



  end
end
