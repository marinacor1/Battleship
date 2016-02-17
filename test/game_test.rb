require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def test_game_initializes
    g = Game.new()
    g.instance_of? Game
  end

  def test_game_identifies_accurately_when_a_ship_is_hit
    g = Game.new
    g.hit_or_miss
    assert_equal "H", g.particular_spot_in_grid
  end

  def test_game_identifies_accurately_when_a_ship_is_a_miss
  end

  def test_game_identifies_when_all_ships_on_one_side_are_sunk
  end


end
