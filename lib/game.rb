require_relative 'player_prompt'
require_relative 'computer_play'

class Game
  attr_reader :shot, :player_setup, :computer_setup, :computer_guess

  #don't pass in anything because both computer play and player prompt need to be able to initialize game
  def initialize#A1
    @possible_responses = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    pp = PlayerPrompt.new
    @player_setup = pp.player_guess
    #it doesn't read player_guess. returns whatever is in the initialize method
    cp = ComputerPlay.new
    @computer_setup = CP.computer_guess
  end

  def map_reading

  end

  def hit_or_miss
    if @shot.start_with?("A")
      # if@shot[1] ==
      # end
    elsif @shot.start_with?("B")

    elsif @shot.start_with?("C")

    else # @shot.start_with?("D")
    end
  end

end
