require 'pry'
require_relative 'player_prompt'

class ShipMap

  def initialize(player_map)
    @player_a = player_map[0].join(" ")
    @player_b = player_map[1].join(" ")
    @player_c = player_map[2].join(" ")
    @player_d = player_map[3].join(" ")
  end

  def print_initial_player_map
    puts "\n\nHere's a view of your ship layout."
    puts "The X marks your ship placement."
    puts "==========="
    puts ".  1 2 3 4"
    puts "#{@player_a}"
    puts "#{@player_b}"
    puts "#{@player_c}"
    puts "#{@player_d}"
  end

end
