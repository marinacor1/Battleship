require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mapping'

class MappingTest < Minitest::Test
  def test_mapping_creates_instance_of_mapping
    i = Mapping.new
    i.instance_of? Mapping
  end

    def test_mapping_creates_instance_of_mapping
      i = Mapping.new
      array =     [["A1", "A2"], ["A2", "A3"], ["A3", "A4"],
          ["B1", "B2"], ["B2", "B3"], ["B3", "B4"],
          ["C1", "C2"], ["C2", "C3"], ["C3", "C4"],
          ["D1", "D2"], ["D2", "D3"], ["D3", "D4"],
          ["A1", "B1"], ["B1", "C1"], ["C1", "D1"],
          ["A2", "B2"], ["B2", "C2"], ["C2", "D2"],
          ["A3", "B3"], ["B3", "C3"], ["C3", "D3"],
          ["A4", "B4"], ["B4", "C4"], ["C4", "D4"]]
      assert_equal array, i.possible_small_responses
    end


end
