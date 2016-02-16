require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def test_game_initializes
    g = Game.new
    g.instance_of? Game
  end



end
