require_relative 'instructions'
require_relative 'player_prompt'

class StartGame
  def initialize
    puts "Welcome to BATTLESHIP"
  end

  def output_reader
    puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit the game?\n"
    output = gets.chomp
    user_output(output)
  end

  def user_output(output)
    if output == 'p'|| output == 'play'
      p = PlayerPrompt.new
      p.player_initial_ship_setup
    elsif output == 'i'|| output == 'instructions'
      i = Instructions.new
      i.instructions
    elsif output == 'q' || output == 'quit'
       abort( "\nExiting game.")
     else
       erroneous_response
     end
   end

   def erroneous_response
      puts "\nThis is not a valid option. Try again."
      user_output
   end

end
