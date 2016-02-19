require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/computer_play'

class ComputerPlayTest < Minitest::Test
  def test_computer_shot_creates_instance
    cs=  ComputerPlay.new
    cs.instance_of? ComputerPlay
  end

  def test_computer_gives_five_coordinates
    cs=  ComputerPlay.new
    setup = cs.computer_generated_ship_placement
    assert_equal 5, setup.length
  end

  def test_computer_guess_falls_in_grid
    cs=  ComputerPlay.new
    guess = cs.computer_generated_ship_placement
    assert cs.possible_small_responses.flatten.include?(guess[0])
    assert cs.possible_small_responses.flatten.include?(guess[1])
    assert cs.possible_large_responses.flatten.include?(guess[2])
    assert cs.possible_large_responses.flatten.include?(guess[3])
    assert cs.possible_large_responses.flatten.include?(guess[4])
  end

  def test_computer_setup_has_no_duplicates
    cs=  ComputerPlay.new
    guess = cs.computer_generated_ship_placement
    guess_without_doubles = guess.uniq
    assert guess == guess_without_doubles
  end

  def test_computer_play_is_random
    cs = ComputerPlay.new
    guess = cs.computer_generated_ship_placement
    cs2 = ComputerPlay.new
    guess2 = cs.computer_generated_ship_placement
    refute guess == guess2
  end

  def test_computer_shot_will_not_repeat_shot
    cs = ComputerPlay.new
    cs_shot_array = []
      15.times do
        cs_shot_array << cs.computer_shot
      end
    assert cs_shot_array == cs_shot_array.uniq
  end
end
