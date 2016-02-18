class EndGame
  include Responses

  def initialize(player_hits, computer_hits)
    @player_hits = player_hits
    @computer_hits = computer_hits
  end

  def final_message
    if @player_hits == 5
      congrats_message
      puts "It took you #{@player_hits} shots."
    else
      sorry_message
      puts "It took the computer #{@computer_hits} shots to win."
    end
  end


end
