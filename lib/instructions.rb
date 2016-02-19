require 'colorize'
class Instructions

  def instructions
    puts "\nBATTLESHIP INSTRUCTIONS: \n\nBATTLESHIP is a violent game of strategy. \nYou are given two ships. One is two units long and one is three units long.  Give five coordinates. The first two will represent where your shorter ship will go. Your last three coordinates will represent where your longer ship will go.  \nThe grid is 4 X 4 with 1-4 on the x-axis and A-C on the y-axis.\n  You will be playing against the computer in an attempt to get their two ships sunk.  After each guess you will get feedback on whether your guess was a hit or miss and did you sink the ship.\n          Here's an example of the grid: \n ============\n . 1 2 3 4\nA\nB\nC\nD\n Best of luck!".colorize(:light_blue)

    puts "\nType anything and return to exit out.".colorize(:yellow)
    output = gets.chomp
      if output
        abort( "\nExiting game.")
      end

  end

end
