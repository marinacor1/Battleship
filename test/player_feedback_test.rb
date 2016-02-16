require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/player_feedback'

class PlayerFeedbackTest < Minitest::Test
  def test_player_feedback_creates_instance_of_PF
    pf = PlayerFeedback.new
    pf.instance_of? PlayerFeedback
  end

  def test_player_feedback_returns_hit_when_guess_is_correct
  end

  def test_player_feedback_returns_miss_when_guess_is_incorrect
  end

  def test_if_hit_and_not_sink_returns_appropriate_response
  end

  def test_if_hit_and_sink_returns_appropriate_response
  end

  def test_if_hit_and_last_ship_ends_game
  end
end
