require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_prompt'

class PlayerPromptTest < Minitest::Test
  def test_player_prompt_creates_instance_of_PP
    pp = PlayerPrompt.new
    pp.instance_of? PlayerPrompt
  end

  def test_if_player_gives_invalid_number_of_coordinates
    pp = PlayerPrompt.new
    assert_equal 0, pp.check("WW")
  end

  def test_player_will_not_let_you_pass_if_you_give_large_ships_first
    pp = PlayerPrompt.new
    assert_equal 0, pp.all_ships_linked("A2 A3 A4 B3 B4")
  end

  def test_if_player_gives_invalid_input_with_row_outside_grid_returns_error
    pp = PlayerPrompt.new
    assert_equal 4, pp.check("X1 A1 A2 B2 B3")
  end

  def test_if_player_gives_invalid_input_with_index_outside_grid_returns_error
    pp = PlayerPrompt.new
    assert_equal 4, pp.check("A1 A2 B1 B2 B10")
  end

  def test_if_player_gives_invalid_input_of_non_linking_returns_error
    pp = PlayerPrompt.new
    assert_equal 1, pp.all_ships_linked("A2 A3 B1 B3 B4")
  end

  def test_player_prompt_organizes_coordinate_info
    pp = PlayerPrompt.new
    pp.coordinate_setup("B1 B2 A4 B4 C4")
    assert_equal ["a:", " ", " ", " ", "X"], pp.a
    assert_equal ["b:", "X", "X", " ", "X"], pp.b
    assert_equal ["c:", " ", " ", " ", "X"], pp.c
    assert_equal ["d:", " ", " ", " ", " "], pp.d
  end

  def test_PP_gives_error_if_invalid_shot_request_by_row
    pp = PlayerPrompt.new
    assert_equal 0, pp.check("Z4")
  end

  def test_PP_gives_error_if_invalid_shot_request_by_index
    pp = PlayerPrompt.new
    assert_equal 0, pp.check("C12")
  end

  def test_pp_allows_player_to_advance_if_correct_coordinates
    pp = PlayerPrompt.new
    assert_equal 5, pp.check("A1 A2 B1 B2 B3")
    assert_equal 2, pp.all_ships_linked("A1 A2 B1 B2 B3")
  end

end
