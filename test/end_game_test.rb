require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/end_game'

class EndGameTest < Minitest::Test
  def test_battleship_creates_instance
    eg= EndGame.new(5, 3)
    eg.instance_of? EndGame
  end

  def test_end_game_provides_accurate_time

  end

  def test_end_game_gives_correct_shots_number

  end

  def test_end_game_gives_congrats_message_if_player_wins
  end

  def test_end_game_gives_sorry_message_if_player_loses
  end
end
