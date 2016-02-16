gem 'minitest', '~5.2'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'end_game'

class EndGameTest < Minitest::Test
  def test_battleship_creates_instance
    eg= EndGame.new
    eg.instance_of? EndGame
  end
end
