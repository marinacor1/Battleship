require_relative 'responses'
require_relative 'game'

class EndGame
  attr_reader :player_attempts, :computer_attempts, :player_hits, :computer_hits
  include Responses

  def initialize(player_attempts, computer_attempts, player_hits, computer_hits)
    @player_attempts = player_attempts
    @computer_attempts = computer_attempts
    @player_hits = player_hits
    @computer_hits = computer_hits
  end

  def final_message
    if @player_hits == 5
      congrats_message
      puts "It took you #{@player_attempts} shots.".colorize(:green)
    else
      sorry_message
      puts "It took the computer #{@computer_attempts} shots to win.".colorize(:green)
    end
  end


end
