require 'colorize'
require 'responses'
class Instructions
  include Responses

  def instructions
    battleship_instructions
    quit_message
    output = gets.chomp
      if output
        abort( "\nExiting game.")
      end
  end

end
