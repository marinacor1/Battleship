require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require './lib/start_game'

class StartGameTest < Minitest::Test
  def test_startgame_instantiates
    sg = StartGame.new
    sg.instance_of? StartGame
  end

end
