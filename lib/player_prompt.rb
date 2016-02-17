require 'pry'
class PlayerPrompt
  attr_reader :error, :a, :b, :c, :d

  def initialize
    @error = false
    @possible_responses = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @a = ["a:", nil, nil, nil, nil]
    @b = ["b:", nil, nil, nil, nil]
    @c = ["c:", nil, nil, nil, nil]
    @d = ["d:", nil, nil, nil, nil]
  end

  def player_initial_ship_setup
    puts "\nI have laid out my ships on the grid. \nYou now need to layout your two ships.\nThe first ship is two units long and the second ship is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nHere's an example of the grid: \n ============\n . 1 2 3 4\nA\nB\nC\nD\n\nEnter the squares for the two-unit ship:\n\nEx.A1 A2 B1 B2 B3\n\n\nChoose wisely."
    input= gets.chomp
    coordinates_check(input)
  end

  def coordinates_check(input)
    count = 0
    @possible_responses.each do |coordinate|
      if input.split.include?(coordinate)
        count +=1
      end
    end
      if count == 5
        coordinate_setup
      else
        erroneous_response
      end
  end

  def coordinate_setup(input)
    input_array = input.upcase.split
    input_array.each do |coordinate|
      # binding.pry
    if coordinate.start_with?("A")
      @a.insert(coordinate[1].to_i, "X")
      @a.delete_at(coordinate[1] + 1)
    elsif coordinate.start_with?("B")
      @b.insert(coordinate[1].to_i, "X")
      @b.delete_at(coordinate[1] + 1)
    elsif coordinate.start_with?("C")
      @c.insert(coordinate[1].to_i, "X")
      @c.delete_at(coordinate[1] + 1)
    else
      @d.insert(coordinate[1].to_i, "X")
      @d.delete_at(coordinate[1] + 1)
    end
  end

  end

  def erroneous_response
    @error = true
    puts "\nThis is not a valid option. Try again."
    player_initial_ship_setup
  end



end
