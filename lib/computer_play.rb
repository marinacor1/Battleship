require 'pry'
class ComputerPlay
  attr_reader :possible_responses
  attr_accessor :guess

  def initialize
    @possible_responses = [["A1", "A2", "A3", "A4"], ["B1", "B2", "B3", "B4"], ["C1", "C2", "C3", "C4"], ["D1", "D2", "D3", "D4"]]
    @guess = []
  end

  def initial_computer_ship_setup
    small_ship_placement
    large_ship_placement
    @guess
  end

  def small_ship_placement
    random_row = rand(0..3)
    @guess << @possible_responses[random_row].shuffle.pop
    coordinate_place = @possible_responses[random_row].index(@guess[0])
    letter_row = @guess[0][0]
    if coordinate_place <= 2
      small_horizontal_placement(coordinate_place, letter_row, random_row)
    else
      small_vertical_placement(coordinate_place, letter_row)
    end
  end

  def small_horizontal_placement(coordinate_place, letter_row, random_row)
    @guess << @possible_responses[random_row][coordinate_place + 1]
    @possible_responses[random_row].delete_at(coordinate_place + 1)
  end

  def small_vertical_placement(coordinate_place, letter_row)
    partner_place = coordinate_place + 1
    if letter_row == "A"
      guess << "B#{partner_place}"
    elsif letter_row == "B"
      guess << "C#{partner_place}"
    elsif letter_row == "C"
      guess << "B#{partner_place}"
    else
      guess << "C#{partner_place}"
    end
  end

  def large_ship_placement
    random_row = rand(0..3)
    binding.pry
    @guess << @possible_responses[random_row].shuffle.pop
    #if you shuffle! you can't get coordinate place, if you leave it, you get repeats
    ship_two_coordinate_place = @possible_responses[random_row].index(@guess[1])
    @guess.delete_at(ship_two_coordinate_place)
    # binding.pry
    ship_two_letter_row = @guess[2][0]
    if ship_two_coordinate_place <= 1
      large_horizontal_placement(random_row, ship_two_coordinate_place)
    else
      large_vertical_placement(ship_two_coordinate_place, ship_two_letter_row)
    end
  end

  def large_horizontal_placement(random_row, ship_two_coordinate_place)
    @guess << @possible_responses[random_row][ship_two_coordinate_place + 1]
    @guess << @possible_responses[random_row][ship_two_coordinate_place + 1]
    @possible_responses[random_row].delete_at(ship_two_coordinate_place + 1)
  end

  def large_vertical_placement(ship_two_coordinate_place, letter_row)
    partner_place = ship_two_coordinate_place + 1
    if letter_row == "A"
      guess << "B#{partner_place}"
      guess << "C#{partner_place}"
    elsif letter_row == "B"
      guess << "C#{partner_place}"
      guess << "D#{partner_place}"
    elsif letter_row == "C"
      guess << "B#{partner_place}"
      guess << "A#{partner_place}"
    else
      guess << "C#{partner_place}"
      guess << "B#{partner_place}"
    end

  end


end
