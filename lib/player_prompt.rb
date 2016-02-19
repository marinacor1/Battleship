require 'pry'
require_relative 'ship_map'
require_relative 'game'
require_relative 'responses'

class PlayerPrompt
  include Responses
  attr_accessor :a, :b, :c, :d, :error

  def initialize
    @possible_small_responses= [["A1", "A2"], ["A2", "A3"], ["A3", "A4"], ["B1", "B2"], ["B2", "B3"], ["B3", "B4"], ["C1", "C2"], ["C2", "C3"], ["C3", "C4"], ["D1", "D2"], ["D2", "D3"], ["D3", "D4"], ["A1", "B1"], ["B1", "C1"], ["C1", "D1"], ["A2", "B2"], ["B2", "C2"], ["C2", "D2"], ["A3", "B3"], ["B3", "C3"], ["C3", "D3"], ["A4", "B4"], ["B4", "C4"], ["C4", "D4"]]
    @possible_large_responses = [["A1", "A2", "A3"], ["A2", "A3", "A4"], ["B1", "B2", "B3"], ["B2", "B3", "B4"], ["C1", "C2", "C3"], ["C2", "C3", "C4"], ["D1", "D2", "D3"], ["D2", "D3", "D4"], ["A1", "B1", "C1"], ["B1", "C1", "D1"], ["A2", "B2", "C2"], ["B2", "C2", "D2"], ["A3", "B3", "C3"], ["B3", "C3", "D3"], ["A4", "B4", "C4"], ["B4", "C4", "D4"]]
    @possible_responses = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @a = ["a:", " ", " ", " ", " "]
    @b = ["b:", " ", " ", " ", " "]
    @c = ["c:", " ", " ", " ", " "]
    @d = ["d:", " ", " ", " ", " "]
  end

  def player_initial_ship_setup
    player_initial_ship_prompt
    input = gets.chomp.upcase
    coordinates_check(input)
    input
  end

  def check(input)
    count = 0
    @possible_responses.each do |coordinate|
      if input.split.include?(coordinate)
        count +=1
      end
    end
      count
  end

  def all_ships_linked(input)
    all_ships = input.split(" ")
    small_ships = (all_ships[0] + " " + all_ships[1])
    large_ships = (all_ships[2] + " " + all_ships[3] + " " + all_ships[4])
    small_check = @possible_small_responses.find_all do |smalls|
       smalls.join(" ") == small_ships
     end
    large_check = @possible_large_responses.find_all do  |larges|
       larges.join(" ") == large_ships
     end
     small_check.length + large_check.length
  end

  def coordinates_check(input)
      if (check(input) == 5) && (all_ships_linked(input) == 2)
      else
        erroneous_response
      end
      if check(input) == 5
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
    coordinate_array = [@a, @b, @c, @d]
  end

  def shot_prompt
    player_shot_prompt
    player_shot = gets.chomp.upcase
  end

  def erroneous_response
    error_prompt
    player_initial_ship_setup
  end

end
