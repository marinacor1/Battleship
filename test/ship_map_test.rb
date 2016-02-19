require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship_map'

class ShipMapTest < Minitest::Test
  def test_ship_map_instantiates
    sm = ShipMap.new([["a:", "X", "X", "X", " "], ["b:", " ", " ", " ", " "], ["c:", "X", "X", " ", " "], ["d:", " ", " ", " ", " "]])
    sm.instance_of? ShipMap
  end

end
