require 'pry'
class GameFlow

  sw = Stopwatch.new
  pp = PlayerPrompt.new
  piss = pp.player_initial_ship_setup
  coordinate_map_setup = pp.coordinate_setup
  sm = ShipMap.new(coordinate_map_setup)
  sm.print_player_map
  cp = ComputerPlay.new
  icss = cp.computer_generated_ship_placement
  g = Game.new(piss, icss, coordinate_map_setup)
  @ph = g.player_hits
  @ch = g.computer_hits
  while (@ph < 4) && (@ch < 6) do
    @ph = g.player_hits
    @ch = g.computer_hits
    puts "Player Hits: #{@ph}"
    puts "Computer Hits: #{@ch}"
    player_shot = pp.shot_prompt
    hm_array = g.hit_or_miss(player_shot)
    sm.print_h_m_player_map(hm_array)
    g.end_turn
     if @ph == 5
       break
     end
    computer_shot = cp.computer_shot
    c_hm_array = g.hits_or_misses_for_player_map(computer_shot)
    shm = ShipMap.new(c_hm_array)
    shm.print_player_map
  end
  pta = g.player_attempts
  cta = g.computer_attempts
  eg = EndGame.new(pta, cta)
  eg.final_message
  sw.time_difference
end
