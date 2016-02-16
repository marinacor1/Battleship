gem 'minitest', '~5.2'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'battleship'

class BattleshipTest < Minitest::Test
  def test_battleship_creates_instance
    bs= Battleship.new
    bs.instance_of? Battleship
  end

  def test_battleship_starts_start_game_sequence

  end

  def test_battleship_allows_to_read_instructions
  end

  def test_battleship_quits_when_prompted
  end

end
