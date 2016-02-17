require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require './lib/start_game'

class StartGameTest < Minitest::Test
  # def test_battleship_creates_instance
  #   bs= Battleship.new
  #   bs.instance_of? StartGame
  # end

  def test_battleship_starts_start_game_sequence_when_type_play
    sg= StartGame.new
    sg.user_output('p')
    sg.instance_of? PlayerPrompt
  end

  def test_battleship_allows_to_read_instructions
    skip
    sg = StartGame.new
    sg.user_output('i')
    sg.instance_of? Instructions
  end

  def test_battleship_quits_when_prompted
    skip
    sg = StartGame.new
    sg.user_output('q')
    sg.abort? #this is probably wrong 
  end

  def test_battleship_returns_erroneous_response_if_user_input_wrong

  end
end
