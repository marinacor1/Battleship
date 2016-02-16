require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_shot'

class ComputerShotTest < Minitest::Test
  def test_computer_shot_creates_instance
    cs=  ComputerShot.new
    cs.instance_of? ComputerShot
  end

  def test_computer_guess_falls_in_grid
  end

  def test_computer_shot_does_not_call_on_a_previous_before
  end

  def test_computer_shot_is_random
  end

  def test_after_computer_plays_shows_info_about_play
  end

  def test_after_computer_plays_shows_map
  end

  def test_at_end_of_computer_game_goes_to_player_shot
  end
end
