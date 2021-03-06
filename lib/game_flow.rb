require 'pry'
require_relative 'instructions'
require_relative 'player_prompt'
require_relative 'responses'
require_relative 'stopwatch'
require_relative 'game'
require_relative 'ship_map'
require_relative 'end_game'

class GameFlow
  attr_reader :ch, :ph

  def initial_runner
    sw = Stopwatch.new
    pp = PlayerPrompt.new
    piss = pp.player_initial_ship_setup
    coordinate_map_setup = pp.coordinate_setup
    sm = ShipMap.new(coordinate_map_setup)
    sm.print_player_map
    computer_play_time(sw, pp, piss, coordinate_map_setup, sm)
  end

  def computer_play_time(sw, pp, piss, coordinate_map_setup, sm)
    cp = ComputerPlay.new
    icss = cp.computer_generated_ship_placement
    game_time(sw, pp, piss, coordinate_map_setup, sm, cp, icss)
  end

  def game_time(sw, pp, piss, coordinate_map_setup, sm, cp, icss)
    g = Game.new(piss, icss, coordinate_map_setup)
    #TODO currently the piss does not reset when a person types wrong and then types right
    @ph = g.player_hits
    @ch = g.computer_hits
    while (@ph < 5) && (@ch < 14) do
      @ph = g.player_hits
      @ch = g.computer_hits
      puts "Player Hits: #{@ph}"
      puts "Computer Hits: #{@ch}"
      player_shot = pp.shot_prompt
      hm_array = g.hit_or_miss(player_shot)
      sm.print_h_m_player_map(hm_array)
      @ph = g.player_hits
      @ch = g.computer_hits
       if @ch == 5 || @ph == 5
        ending_game(g, sw)
      end
      g.end_turn
      computer_shot = cp.computer_shot
      c_hm_array = g.hits_or_misses_for_player_map(computer_shot)
      shm = ShipMap.new(c_hm_array)
      shm.print_player_map
      @ph = g.player_hits
      @ch = g.computer_hits
     end
       if @ch == 5 || @ph == 5
         ending_game(g, sw)
       end
  end

  def ending_game(g, sw)
    pta = g.player_attempts
    cta = g.computer_attempts
    gh = g.computer_hits
    ph = g.player_hits

    eg = EndGame.new(pta, cta, ph, ch)
    eg.final_message
    sw.time_difference
  end
end
