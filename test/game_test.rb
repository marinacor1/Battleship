require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def test_game_initializes
    g = Game.new("A1 A2 A3 B1 B2", "C1 C2 C3 B3 B4", [["a:", "X", "X", "X", " "], ["b:", "X", "X", " ", " "], ["c:", " ", " ", " ", " "], ["d:", " ", " ", " ", " "]])
    g.instance_of? Game
  end

  def test_game_identifies_when_computer_gets_hit
    g = Game.new("A1 A2 A3 B1 B2", "C1 C2 C3 B3 B4", [["a:", "X", "X", "X", " "], ["b:", "X", "X", " ", " "], ["c:", " ", " ", " ", " "], ["d:", " ", " ", " ", " "]])
    g.hit_or_miss("B3")
    assert_equal ["b:", " ", " ", "H", " "], g.b_hm_map
  end

  def test_game_identifies_when_computer_gets_miss
    g = Game.new("A1 A2 A3 B1 B2", "C1 C2 C3 B3 B4", [["a:", "X", "X", "X", " "], ["b:", "X", "X", " ", " "], ["c:", " ", " ", " ", " "], ["d:", " ", " ", " ", " "]])
    g.hit_or_miss("D1")
    assert_equal ["d:", "M", " ", " ", " "], g.d_hm_map
  end

  def test_game_identifies_when_player_gets_hit
    g = Game.new("A1 A2 A3 B1 B2", "C1 C2 C3 B3 B4", [["a:", "X", "X", "X", " "], ["b:", "X", "X", " ", " "], ["c:", " ", " ", " ", " "], ["d:", " ", " ", " ", " "]])
    g.hits_or_misses_for_player_map("B1")
    assert_equal ["b:", "X*", "X", " ", " "], g.p_map[1]
  end

  def test_game_identifies_when_player_gets_miss
    g = Game.new("A1 A2 A3 B1 B2", "C1 C2 C3 B3 B4", [["a:", "X", "X", "X", " "], ["b:", "X", "X", " ", " "], ["c:", " ", " ", " ", " "], ["d:", " ", " ", " ", " "]])
    g.hits_or_misses_for_player_map("D4")
    assert_equal ["d:", " ", " ", " ", " "], g.p_map[3]
  end

  def test_game_identifies_when_its_a_miss_even_if_its_other_teams_ship_for_p
    g = Game.new("A1 A2 A3 B1 B2", "C1 C2 C3 B3 B4", [["a:", "X", "X", "X", " "], ["b:", "X", "X", " ", " "], ["c:", " ", " ", " ", " "], ["d:", " ", " ", " ", " "]])
    g.hits_or_misses_for_player_map("B4")
    assert_equal ["b:", "X", "X", " ", " "], g.p_map[1]
  end

  def test_game_identifies_when_its_a_miss_even_if_its_other_teams_ship_for_c
    g = Game.new("A1 A2 A3 B1 B2", "C1 C2 C3 B3 B4", [["a:", "X", "X", "X", " "], ["b:", "X", "X", " ", " "], ["c:", " ", " ", " ", " "], ["d:", " ", " ", " ", " "]])
    g.hit_or_miss("A1")
    assert_equal ["a:", "M", " ", " ", " "], g.a_hm_map
  end

  def test_game_identifies_when_all_ships_on_one_side_are_sunk
    skip
    g = Game.new("A1 A2 A3 B1 B2", "C1 C2 C3 B3 B4", [["a:", "X", "X", "X", " "], ["b:", "X", "X", " ", " "], ["c:", " ", " ", " ", " "], ["d:", " ", " ", " ", " "]])

  end


end
