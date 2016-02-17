module Responses

  def player_initial_ship_prompt
    puts "\nI have laid out my ships on the grid. \nYou now need to layout your two ships.\nThe first ship is two units long and the second ship is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nHere's an example of the grid: \n ============\n . 1 2 3 4\nA\nB\nC\nD\n\nEnter the squares for the three unit ship and two unit ship:\n\nEx.A1 A2 B1 B2 B3\n\n\nChoose wisely. Leave spaces between each coordinate."
  end

  def player_shot_prompt
    puts "\nNow it's your turn to fire. You will choose one coordinate for one shot.  If you guess correctly, it is a hit. If you guess incorrectly, it is a miss. If you guess outside the grid, you will get an error."
  end

  def error_prompt
    puts "\nThis is not a valid option. Try again."
  end


end
