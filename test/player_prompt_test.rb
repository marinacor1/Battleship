require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_prompt'

class PlayerPromptTest < Minitest::Test
  def test_player_prompt_creates_instance_of_PP
    pp = PlayerPrompt.new
    pp.instance_of? PlayerPrompt
  end

  def test_if_player_gives_invalid_input_outside_grid_returns_error
    pp = PlayerPrompt.new
    pp.coordinates_check("WW")
    assert pp.error
  end

  def test_if_player_gives_invalid_input_of_non_linking_returns_error
    skip
    pp = PlayerPrompt.new
    pp.coordinates_check("A1 A3 A4 B1 B2")
    assert pp.error
  end

  def test_player_prompt_organizes_coordinate_info
    skip
    pp = PlayerPrompt.new
    pp.coordinate_setup("a1 a2 a4 b4 c4")#.split(" ").
    assert_equal ["a:", "X", "X", " ", "X"], pp.a
    assert_equal ["b:", " ", " ", " ", "X"], pp.b
    assert_equal ["c:", " ", " ", " ", "X"], pp.c
    assert_equal ["d:", " ", " ", " ", " "], pp.d
  end

  def test_PP_gives_error_if_invalid_shot_request
    skip
    pp = PlayerPrompt.new
    pp.coordinates_check("Z4")
    assert pp.error
  end

  def test_after_play_player_is_prompted_to_end
  end


end
