require 'pry'

class ComputerPlay
  attr_reader :possible_responses
  attr_accessor :computer_placement

  def initialize
    @possible_responses = [["A1", "A2", "A3", "A4"], ["B1", "B2", "B3", "B4"], ["C1", "C2", "C3", "C4"], ["D1", "D2", "D3", "D4"]]
    @computer_placement = []
  end

  def initial_computer_ship_setup
    small_ship_placement
    large_ship_placement
    @computer_placement
  end

  def small_ship_placement
    random_row = rand(0..3)
    @computer_placement << @possible_responses[random_row].shuffle.pop
    coordinate_place = @possible_responses[random_row].index(@computer_placement[0])
    letter_row = @computer_placement[0][0]
    if coordinate_place <= 2
      small_horizontal_placement(coordinate_place, letter_row, random_row)
    else
      small_vertical_placement(coordinate_place, letter_row)
    end
  end

  def small_horizontal_placement(coordinate_place, letter_row, random_row)
    @computer_placement << @possible_responses[random_row][coordinate_place + 1]
    @possible_responses[random_row].delete_at(coordinate_place + 1)
  end

  def small_vertical_placement(coordinate_place, letter_row)
    partner_place = coordinate_place + 1
    if letter_row == "A"
      computer_placement << "B#{partner_place}"
    elsif letter_row == "B"
      computer_placement << "C#{partner_place}"
    elsif letter_row == "C"
      computer_placement << "B#{partner_place}"
    else
      computer_placement << "C#{partner_place}"
    end
  end

  def large_ship_placement
    random_row = rand(0..3)
    # binding.pry
    @computer_placement << @possible_responses[random_row].shuffle.pop
    #if you shuffle! you can't get coordinate place, if you leave it, you get repeats
    ship_two_coordinate_place = @possible_responses[random_row].index(@computer_placement[2])
    # binding.pry
    @possible_responses.delete_at(ship_two_coordinate_place)
    # binding.pry
    ship_two_letter_row = @computer_placement[2][0]
    if ship_two_coordinate_place <= 1
      large_horizontal_placement(random_row, ship_two_coordinate_place)
    else
      large_vertical_placement(ship_two_coordinate_place, ship_two_letter_row)
    end
  end

  def large_horizontal_placement(random_row, ship_two_coordinate_place)
    @computer_placement << @possible_responses[random_row][ship_two_coordinate_place + 1]
    @computer_placement << @possible_responses[random_row][ship_two_coordinate_place + 1]
    @possible_responses[random_row].delete_at(ship_two_coordinate_place + 1)
  end

  def large_vertical_placement(ship_two_coordinate_place, letter_row)
    partner_place = ship_two_coordinate_place + 1
    if letter_row == "A"
      @computer_placement << "B#{partner_place}"
      @computer_placement << "C#{partner_place}"
    elsif letter_row == "B"
      @computer_placement << "C#{partner_place}"
      @computer_placement << "D#{partner_place}"
    elsif letter_row == "C"
      @computer_placement << "B#{partner_place}"
      @computer_placement << "A#{partner_place}"
    else
      @computer_placement << "C#{partner_place}"
      @computer_placement << "B#{partner_place}"
    end
  end

  def computer_guess
    @computer_placement
  end


end
