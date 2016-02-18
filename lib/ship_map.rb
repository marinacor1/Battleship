require 'pry'
require_relative 'player_prompt'
require 'colorize'

class ShipMap

  def initialize(player_map)
    @player_a = player_map[0].join(" ")
    @player_b = player_map[1].join(" ")
    @player_c = player_map[2].join(" ")
    @player_d = player_map[3].join(" ")
  end

  def print_initial_player_map
    puts "\n\nHere's a view of your ship layout."
    print "The "
    print "X ".colorize(:blue)
    puts "marks your ship placement."
    puts "==========="
    puts ".  1 2 3 4"
    puts "#{@player_a}"
    puts "#{@player_b}"
    puts "#{@player_c}"
    puts "#{@player_d}"
  end

  def print_h_m_player_map(hm_array)
    puts "\n\nHere's a view of your hits and misses."
    print "An "
    print "H ".colorize(:green)
    print "is a hit. An "
    print "M".colorize(:red)
    puts " is a miss."
    puts "==========="
    puts ".  1 2 3 4"
    puts "#{hm_array[0].join(" ")}".colorize(:light_green)
    puts "#{hm_array[1].join(" ")}".colorize(:light_green)
    puts "#{hm_array[2].join(" ")}".colorize(:light_green)
    puts "#{hm_array[3].join(" ")}\n".colorize(:light_green)
  end

end
