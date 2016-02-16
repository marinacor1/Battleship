gem 'minitest', '~5.2'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'player_prompt'

class PlayerPromptTest < Minitest::Test
  def test_player_prompt_creates_instance_of_PP
    pp = PlayerPrompt.new
    pp. instance_of? PlayerPrompt
  end

  def test_pp_prompts_player_to_play
  end

  def test_if_player_gives_invalid_input_returns_error
  end

  def test_player_prompt_allows_coordinate_info
  end


end
