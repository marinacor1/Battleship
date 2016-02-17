require_relative 'player_prompt'

class ShipMap
  attr_reader :a, :b, :c, :d

  def initialize(player_a, player_b, player_c, player_d) #A1
    @player_a = player_a.join(" ") #X X nil X
    @player_b = player_b.join(" ")
    @player_c = player_c.join(" ")
    @player_d = player_d.join(" ")
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
