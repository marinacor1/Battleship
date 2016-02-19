require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_flow'

class GameFlowTest < Minitest::Test
  def test_game_flow_instantiates
    gf = GameFlow.new
    gf.instance_of? GameFlow
  end

end
