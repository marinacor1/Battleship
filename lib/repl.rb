require_relative 'start_game'

class RePL
  def initialize
    @sg = StartGame.new
    io_loop
  end

  def io_loop
    loop do
      output = @sg.user_output(gets.chomp)
      break if output.nil?
      puts output
    end
    return nil
  end
end
