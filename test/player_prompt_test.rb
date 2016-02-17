require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_prompt'

class PlayerPromptTest < Minitest::Test
  def test_player_prompt_creates_instance_of_PP
    pp = PlayerPrompt.new
    pp.instance_of? PlayerPrompt
  end

  def test_if_player_gives_invalid_input_returns_error
    skip
    pp = PlayerPrompt.new
    assert pp.coordinates_check("WW").error
  end

  def test_player_prompt_organizes_coordinate_info
    pp = PlayerPrompt.new
    pp.coordinate_setup("a1 a2 a4 b4 c4")
    assert_equal ["A:", "X", "X", nil, "X"], pp.a
    assert_equal ["B:", nil, nil, nil, "X"], pp.b
    assert_equal ["C:", nil, nil, nil, "X"], pp.c
    assert_equal ["D:", nil, nil, nil, nil], pp.d
  end

  def test_after_play_player_is_prompted_to_end
  end


end
