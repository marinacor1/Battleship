class Stopwatch

  def time_difference
    time_diff = (Time.now - initial_time).divmod(60)
    @minutes = time_diff[0]
    @seconds = time_diff[1].to_i
  end

end
