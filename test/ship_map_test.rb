require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship_map'

class ShipMapTest < Minitest::Test
  def test_ship_map_instantiates
    sm = ShipMap.new
    sm.instance_of? ShipMap
  end

  def test_ship_map_has_four_by_four_grid
    skip
    sm = ShipMap.new
    assert_equal 4, sm.length
    assert_equal 4, sm.width #this is incorrect
  end

  def test_if_player_hits_ship_map_changes_accordingly
  end

  def test_if_player_misses_ship_map_changes_accordingly
  end

  def test_players_coordinates_change_display_map
  end

  def test_player_can_see_their_player_boats_on_map
  end
end
