class Stopwatch
  attr_reader = :initial_time

  def initialize
    @initial_time = Time.now
  end

  def time_difference
    time_diff = (Time.now - @initial_time).divmod(60)
    @minutes = time_diff[0]
    @seconds = time_diff[1].to_i
    time_display
  end

  def time_display
    puts "The total time for the game was #{@minutes} minutes and #{@seconds} seconds.".colorize(:blue)
  end

end
