# require_relative 'battleship'

class Stopwatch
  attr_reader :initial_time
  attr_accessor :minutes, :seconds

  def initialize
    @initial_time = Time.now
  end

  def time_difference
    time_diff = (Time.now - @initial_time).divmod(60)
    @minutes = time_diff[0]
    @seconds = time_diff[1].to_i
    time_display
    new_prompt
  end

  def time_display
    puts "The total time for the game was #{@minutes} minute(s) and #{@seconds} second(s).".colorize(:blue)
  end

  def new_prompt
        puts "\nType anything and return to exit out."
    output = gets.chomp
      if output
        abort( "\nExiting game.")
      end
  end

end
