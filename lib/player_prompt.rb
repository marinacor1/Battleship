require 'pry'
require_relative 'ship_map'
require_relative 'game'
require_relative 'responses'

class PlayerPrompt
  include Responses
  attr_reader :error

  def initialize
    @error = false
    @possible_responses = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @a = ["a:", " ", " ", " ", " "]
    @b = ["b:", " ", " ", " ", " "]
    @c = ["c:", " ", " ", " ", " "]
    @d = ["d:", " ", " ", " ", " "]
  end

  def player_initial_ship_setup
    player_initial_ship_prompt
    @player_init_setup = gets.chomp.upcase
    input = @player_init_setup
    coordinates_check(input)
    input
  end

  def coordinates_check(input)
    count = 0
    @possible_responses.each do |coordinate|
      if @player_init_setup.split.include?(coordinate)
        count +=1
      else
        count = count
      end
      #check to see if the guesses are linking i.e. not just d1 a3 b2 that passes
    end
      if count == 5
        coordinate_setup
      else
        erroneous_response
      end
  end

  def coordinate_setup
    input_array = @player_init_setup.split
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
    coordinate_array = [@a, @b, @c, @d]
  end

  def shot_prompt
    player_shot_prompt
    player_shot = gets.chomp.upcase
  end

  def erroneous_response
    @error = true
    error_prompt
    player_initial_ship_setup
  end



end
