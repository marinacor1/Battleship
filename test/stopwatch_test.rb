require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/stopwatch'

class StopwatchTest < Minitest::Test
  def test_stopwatch_instantiates
    sw = Stopwatch.new
    sw.instance_of? Stopwatch
  end


end
