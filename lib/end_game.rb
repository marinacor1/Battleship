class EndGame
  include Responses 

  def initialize(player_hits, computer_hits)
    @player_hits = player_hits
    @computer_hits = computer_hits
  end

  def final_message
    if @player_hits == 5
      congrats_message
    else
      sorry_message
    end
  end


end
