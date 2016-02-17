require 'pry'
require_relative 'ship_map'
require_relative 'game'

class PlayerPrompt
  attr_reader :error, :player_shot

  def initialize
    @error = false
    @possible_responses = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @a = ["a:", " ", " ", " ", " "]
    @b = ["b:", " ", " ", " ", " "]
    @c = ["c:", " ", " ", " ", " "]
    @d = ["d:", " ", " ", " ", " "]
    @player_shot = " "
  end

  def player_initial_ship_setup
    puts "\nI have laid out my ships on the grid. \nYou now need to layout your two ships.\nThe first ship is two units long and the second ship is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nHere's an example of the grid: \n ============\n . 1 2 3 4\nA\nB\nC\nD\n\nEnter the squares for the two-unit ship:\n\nEx.A1 A2 B1 B2 B3\n\n\nChoose wisely. Leave spaces between each coordinate."
    @player_init_setup = gets.chomp.upcase
    input = @player_init_setup
    #we need to send this guess over to game.rb
    #
    coordinates_check(input)
  end

  def player_setup
    @player_init_setup
  end

  def coordinates_check(input)
    count = 0
    @possible_responses.each do |coordinate|
      if input.split.include?(coordinate)
        count +=1
      else
        count = count
      end
      #check to see if the guesses are linking i.e. not just d1 a3 b2 that passes
    end
      if count == 5
        coordinate_setup(input)
      else
        erroneous_response
      end
  end

  def coordinate_setup(input)
    input_array = input.split
    input_array.each do |coordinate|
      if coordinate.start_with?("A")
        @a.insert(coordinate[1].to_i, "X")
        @a.delete_at(coordinate[1].to_i + 1)
      elsif coordinate.start_with?("B")
        @b.insert(coordinate[1].to_i, "X")
        @b.delete_at(coordinate[1].to_i + 1)
      elsif coordinate.start_with?("C")
        @c.insert(coordinate[1].to_i, "X")
        @c.delete_at(coordinate[1].to_i + 1)
      else
        @d.insert(coordinate[1].to_i, "X")
        @d.delete_at(coordinate[1].to_i + 1)
      end
    end
    map_display
  end

  def map_display
    sm = ShipMap.new(@a, @b, @c, @d)
    sm.print_initial_player_map
    shot_prompt
  end

  def shot_prompt
    puts "\nNow it's your turn to fire. You will choose one coordinate for one shot.  If you guess correctly, it is a hit. If you guess incorrectly, it is a miss. If you guess outside the grid, you will get an error."
    @player_shot = gets.chomp.upcase    
  end

  def erroneous_response
    puts "\nThis is not a valid option. Try again."
    @error = true
    player_initial_ship_setup
  end



end
