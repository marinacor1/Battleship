require 'colorize'
module Responses

  def welcome_prompt
    puts "Welcome to BATTLESHIP".colorize(:light_blue)
  end

  def game_choices_prompt
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit the game?\n"
  end

  def battleship_instructions
    puts "\nBATTLESHIP INSTRUCTIONS:".colorize(:light_yellow)
    puts "\nBATTLESHIP is a violent game of strategy. \nYou are given two ships. One is two units long and one is three units long.  Give five coordinates.".colorize(:light_blue)
    print "The first two will represent where your shorter ship will go. Your last three coordinates will represent where your longer ship will go.".colorize(:light_blue)
    puts "The grid is 4 X 4 with 1-4 on the x-axis and A-C on the y-axis.\n  You will be playing against the computer in an attempt to get their two ships sunk.".colorize(:light_blue)
    puts "After each guess you will get feedback on whether your guess was a hit or miss and did you sink the ship.\n".colorize(:light_blue)
    puts "Here's an example of the grid: \n ============\n . 1 2 3 4\nA\nB\nC\nD\n Best of luck!".colorize(:light_blue)
  end

  def quit_message
    puts "\nType anything and return to exit out.".colorize(:yellow)
  end

  def player_initial_ship_prompt
    puts "\nI have laid out my ships on the grid. \nYou now need to layout your two ships.".colorize(:green)
    print "The first ship is two units long and the second ship is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\n".colorize(:green)
    print "Here's an example of the grid:"
    puts "\n ============\n . 1 2 3 4\nA\nB\nC\nD".colorize(:yellow)
    puts "\nEnter the squares for the two unit ship and three unit ship:".colorize(:light_red)
    puts "\nEx.A1 A2 B1 B2 B3".colorize(:red)
    puts "\n\nChoose wisely. Leave spaces between each coordinate."
  end

  def player_shot_prompt
    puts "\nNow it's your turn to fire. You will choose one coordinate for one shot.  If you guess correctly, it is a hit. If you guess incorrectly, it is a miss. \nIf you guess outside the grid, you will get an error.".colorize(:light_red)
  end

  def error_prompt
    puts "\nThis is not a valid option. Try again.".colorize(:red)
  end

  def congrats_message
    puts "\n\nCongratulations!!!".colorize(:yellow)
    puts "You won the game and sunk all of the computer's battleships. "
  end

  def sorry_message
    puts "\n\nSorry. :( You lost the game. Better luck next time!".colorize(:red)
  end

  def end_turn_message
    puts "Press (E)nter to end your turn.".colorize(:light_yellow)
  end

  def computers_turn_message
    puts "\nNow it's the computer's turn.".colorize(:green)
  end

  def hit_message
    puts "\n\nOh no. You were hit!".colorize(:light_red)
  end

  def miss_message
    puts "Nice. I missed you!".colorize(:light_blue)
  end





end
