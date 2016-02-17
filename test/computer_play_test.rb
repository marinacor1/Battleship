require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_play'

class ComputerPlayTest < Minitest::Test
  def test_computer_shot_creates_instance
    cs=  ComputerPlay.new
    cs.instance_of? ComputerPlay
  end

  def test_computer_gives_is_five_coordinates
    cs=  ComputerPlay.new
    cs.initial_computer_ship_setup
    assert_equal 5, cs.guess.length
  end

  def test_computer_guess_falls_in_grid
    cs=  ComputerPlay.new
    guess = cs.initial_computer_ship_setup
    assert cs.possible_responses.include?(guess[0])
    assert cs.possible_responses.include?(guess[1])
    assert cs.possible_responses.include?(guess[2])
    assert cs.possible_responses.include?(guess[3])
    assert cs.possible_responses.include?(guess[4])
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
