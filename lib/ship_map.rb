require_relative 'player_prompt'

class ShipMap
  attr_reader :a, :b, :c, :d

  def print_initial_player_map
    puts ". 1 2 3 4"
    puts "#{@a}"
    puts "#{@b}"
    puts "#{@c}"
    puts "#{@d}"
  end

end
