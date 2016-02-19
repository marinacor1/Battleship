require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/end_game'

class EndGameTest < Minitest::Test
  def test_battleship_creates_instance
    eg= EndGame.new(5, 3)
    eg.instance_of? EndGame
  end

  def test_end_game_gives_correct_attempts_number_if_player_wins
    eg= EndGame.new(5, 3)
    assert_equal 5, eg.player_attempts
  end

  def test_end_game_gives_correct_attempts_number_if_computer_wins
    eg= EndGame.new(2, 5)
    assert_equal 5, eg.computer_attempts
  end

end
