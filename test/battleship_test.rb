require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'

class BattleshipTest < Minitest::Test
  def test_battleship_creates_instance
    bs= Battleship.new
    bs.instance_of? Battleship
  end

  def test_battleship_starts_start_game_sequence_when_type_play
    skip
    bs= Battleship.new
    #user_output = p
    bs.instance_of? StartGame
  end

  def test_battleship_allows_to_read_instructions
    skip
    bs= Battleship.new
    #user_output = p
    bs.instance_of? Instructions 
  end

  def test_battleship_quits_when_prompted
  end

end
