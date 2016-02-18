require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship_map'

class ShipMapTest < Minitest::Test
  def test_ship_map_instantiates
    sm = ShipMap.new([["a:", "X", "X", "X", " "], ["b:", " ", " ", " ", " "], ["c:", "X", "X", " ", " "], ["d:", " ", " ", " ", " "]])
    sm.instance_of? ShipMap
  end

  def test_players_coordinates_change_display_map
  end

  def test_player_can_see_their_player_boats_on_map
  end
end
