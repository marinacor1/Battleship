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
    assert pp.player_setting_up_coordinates("WW").error
  end

  def test_player_prompt_allows_only_coordinate_info
  end

  def test_after_play_player_is_prompted_to_end
  end


end
