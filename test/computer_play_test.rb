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
    assert_equal 5, cs.initial_computer_ship_setup.length
  end

  def test_computer_guess_falls_in_grid
    cs=  ComputerPlay.new
    @possible_responses = [["A1", "A2", "A3", "A4"], ["B1", "B2", "B3", "B4"], ["C1", "C2", "C3", "C4"], ["D1", "D2", "D3", "D4"]]
    guess = cs.initial_computer_ship_setup
    assert cs.possible_responses.include?(guess[0])
    assert cs.possible_responses.include?(guess[1])
    assert cs.possible_responses.include?(guess[2])
    assert cs.possible_responses.include?(guess[3])
    assert cs.possible_responses.include?(guess[4])
  end

  def test_computer_play_does_not_call_on_a_previous_before
    cs=  ComputerPlay.new
    guess = cs.initial_computer_ship_setup
    duplicates = guess.detect { |coordinate| guess.count(coordinate) > 1}
    assert duplicates.empty?
  end

  def test_computer_play_is_random
    skip
    cs = ComputerPlay.new
    guess = cs.initial_computer_ship_setup
    cs2 = ComputerPlay.new
    guess2 = cs.initial_computer_ship_setup
    refute guess == guess2
  end

  def test_after_computer_plays_shows_info_about_play
  end

  def test_after_computer_plays_shows_map
  end

  def test_at_end_of_computer_game_goes_to_player_shot
  end
end
