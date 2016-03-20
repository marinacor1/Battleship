require 'pry'
require_relative 'ship_map'
require_relative 'game'
require_relative 'responses'

class PlayerPrompt
  include Responses
  attr_accessor :a, :b, :c, :d, :error, :p_input

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
    input = gets.chomp.upcase #TODO need to reset the input if does not pass the coordintes check
    coordinates_check(input)
    input
  end

  def check(input)
    count = 0
    count_small = small_check(input)
    count_large = large_check(input)
    count = count_small + count_large
  end

  def small_check(input)
    count = 0
    small_responses = []
    small_responses << input.split[0]
    small_responses << input.split[1]
    @possible_small_responses.each do |coordinate|
      if small_responses == coordinate #need to create check that they are a pair
        count +=2
      end
    end
    count
  end

  def large_check(input)
    count = 0
    large_responses = []
    large_responses << input.split[2]
    large_responses << input.split[3]
    large_responses << input.split[4]
    @possible_large_responses.each do |coordinate|
      if large_responses == coordinate #need to create check that they are a pair
        count +=3
      end
    end
    count
  end

  def all_ships_linked(input)
    all_ships = input.split(" ")
    small_ships = (all_ships[0] + " " + all_ships[1])
    large_ships = (all_ships[2] + " " + all_ships[3] + " " + all_ships[4])
    small_check = @possible_small_responses.find_all do |smalls|
       smalls.join(" ") == small_ships || smalls.reverse.join(" ") == small_ships
     end
    large_check = @possible_large_responses.find_all do  |larges|
       larges.join(" ") == large_ships || larges.reverse.join(" ") == large_ships
     end
     small_check.length + large_check.length
  end

  def coordinates_check(input)
    if (check(input) == 5) && (all_ships_linked(input) == 2)
      @p_input = input
    else
      erroneous_response
      input = gets.chomp.upcase
    end
    if check(input) == 5
      coordinate_setup
    else
      erroneous_response
      input = gets.chomp.upcase
    end
  end

  # def coordinate_setup
  #   input_array = @p_input.split
  #   input_array.each do |coordinate|
  #     if coordinate.start_with?("A")
  #       @a.insert(coordinate[1].to_i, "X")
  #       @a.delete_at(coordinate[1].to_i + 1)
  #     elsif coordinate.start_with?("B")
  #       @b.insert(coordinate[1].to_i, "X")
  #       @b.delete_at(coordinate[1].to_i + 1)
  #     elsif coordinate.start_with?("C")
  #       @c.insert(coordinate[1].to_i, "X")
  #       @c.delete_at(coordinate[1].to_i + 1)
  #     else
  #       @d.insert(coordinate[1].to_i, "X")
  #       @d.delete_at(coordinate[1].to_i + 1)
  #     end
  #   end
  #   coordinate_array = [@a, @b, @c, @d]
  # end

  def coordinate_setup
    input_array = @p_input.split
    coordinate_match = {"A" => @a, "B" => @b, "C" => @c, "D" => @d}
    input_array.each do |coordinate|
      coordinate_match[coordinate[0]].insert(coordinate[1].to_i, "X")
      coordinate_match[coordinate[0]].delete_at(coordinate[1].to_i + 1)
    end
    coordinate_array = [@a, @b, @c, @d]
  end

  def shot_prompt
    player_shot_prompt
    player_shot = gets.chomp.upcase
    if shot_check?(player_shot)
      player_shot
    else
      shot_prompt
    end
  end

  def shot_check?(player_shot)
    if @possible_responses.include?(player_shot)
     true
    end
  end

  def erroneous_response
    error_prompt
    player_initial_ship_setup
  end

end
