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
    g = Game.new("A1 A2 A3 B2 B3", "A1 A2 A3 B2 B3")
    g.hit_or_miss("C1")
    assert_equal ["c:", "M", " ", " ", " "], g.c_hm_map
  end

  def test_game_identifies_when_computer_gets_hit
    skip
    g = Game.new("A1 A2 A3 B2 B3", "A1 A2 A3 B2 B3")
    g.hits_or_misses_for_player_map("A1 A2 A3 B1 B2", "B1")
  end

  def test_game_identifies_when_computer_gets_miss
    skip
    g = Game.new("A1 A2 A3 B2 B3", "A1 A2 A3 B2 B3")
    g.hits_or_misses_for_player_map("A1 A2 A3 B1 B2", "B1")
  end



  def test_game_identifies_when_all_ships_on_one_side_are_sunk

  end


end
