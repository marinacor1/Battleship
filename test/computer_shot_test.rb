gem 'minitest', '~5.2'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'computer_shot'

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
end
