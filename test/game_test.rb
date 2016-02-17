require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def test_game_initializes
    g = Game.new("A1 A2 A3 B2 B3", "A1 A2 A3 B2 B3")
    g.instance_of? Game
  end

  def test_game_identifies_accurately_when_a_ship_is_hit
    g = Game.new("A1 A2 A3 B2 B3", "A1 A2 A3 B2 B3")
    g.hit_or_miss("A1")
    assert_equal ["a:", "H", " ", " ", " "], g.a_hm_map
  end

  def test_game_identifies_accurately_when_a_ship_is_a_miss
  end

  def test_game_identifies_when_all_ships_on_one_side_are_sunk
  end


end
