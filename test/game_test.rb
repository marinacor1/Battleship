gem 'minitest', '~5.2'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game'

class GameTest < Minitest::Test
  def test_game_initializes
    g = Game.new
    g.instance_of? Game
  end

  def test_
end
