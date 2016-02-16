gem 'minitest', '~5.2'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'player_feedback'

class PlayerFeedbackTest < Minitest::Test
  def test_player_feedback_creates_instance_of_PF
    pf = PlayerFeedback.new
    pf. instance_of? PlayerFeedback
  end
