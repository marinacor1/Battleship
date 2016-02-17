class PlayerPrompt

  def player_initial_ship_setup
    puts "\nI have laid out my ships on the grid. \nYou now need to layout your two ships.\nThe first ship is two units long and the second ship is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nHere's an example of the grid: \n ============\n . 1 2 3 4\nA\nB\nC\nD\n\nEnter the squares for the two-unit ship:\n\nEx.A1 A2 B1 B2 B3\n\n\nChoose wisely."
    output= gets.chomp
    player_setting_up_coordinates(output)
  end

  def player_setting_up_coordinates(output)
    possible_responses = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    count = 0
    possible_responses.each do |coordinate|
      if output.split.include?(coordinate)
        count +=1
      end
    end
    # else
    #   erroneous_response
    # end
  end

  def erroneous_response
      puts "\nThis is not a valid option. Try again."
      user_output
   end



end
