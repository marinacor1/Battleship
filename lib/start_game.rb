require_relative 'instructions'
require_relative 'responses'
require_relative 'game_flow'

class StartGame
  include Responses
  def initialize
    welcome_prompt
  end

  def output_reader
    game_choices_prompt
    output = gets.chomp
    user_output(output)
  end

  def user_output(output)
    if output == 'p'|| output == 'play'
      gf = GameFlow.new
      gf.runner
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
    error_prompt
    user_output
  end

end
