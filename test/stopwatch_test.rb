require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/stopwatch'

class StopwatchTest < Minitest::Test
  def test_stopwatch_instantiates
    sw = Stopwatch.new
    sw.instance_of? Stopwatch
  end

  def test_initial_time_is_a_time
    sw = Stopwatch.new
    assert_equal Time, sw.initial_time.class
  end

end
