require_relative 'instructions'
require_relative 'player_prompt'
require_relative 'responses'

class StartGame
  include Responses
  def initialize
    welcome_prompt
  end

  def output_reader
    game_choices_prompt
    output = gets.chomp
    user_output(output)
  end

  def user_output(output)
    if output == 'p'|| output == 'play'
      game_flow
    elsif output == 'i'|| output == 'instructions'
      i = Instructions.new
      i.instructions
    elsif output == 'q' || output == 'quit'
      abort( "\nExiting game.")
     else
      erroneous_response
     end
   end

  def game_flow
    pp = PlayerPrompt.new
    piss = pp.player_initial_ship_setup
    coordinate_map_setup = pp.coordinate_setup
    sm = ShipMap.new(coordinate_map_setup)
    sm.print_player_map
    cp = ComputerPlay.new
    icss = cp.computer_generated_ship_placement
    sw = Stopwatch.new
    g = Game.new(piss, icss, coordinate_map_setup)
    player_shot = pp.shot_prompt
    hm_array = g.hit_or_miss(player_shot)
    sm.print_h_m_player_map(hm_array)
    g.end_turn
    computer_shot = cp.computer_shot
    c_hm_array = g.hits_or_misses_for_player_map(computer_shot)
    shm = ShipMap.new(c_hm_array)
    shm.print_player_map
    #loop game
    #end game flow:
    ph = g.player_total_hits
    ch = g.computer_total_hits
    eg = EndGame.new(ph, ch)
    eg.final_message
    sw.time_difference
    end

  def erroneous_response
    error_prompt
    user_output
  end

end
