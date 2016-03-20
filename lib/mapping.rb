require 'pry'
class Mapping
    # @possible_small_responses=
    [["A1", "A2"], ["A2", "A3"], ["A3", "A4"],
    ["B1", "B2"], ["B2", "B3"], ["B3", "B4"],
    ["C1", "C2"], ["C2", "C3"], ["C3", "C4"],
    ["D1", "D2"], ["D2", "D3"], ["D3", "D4"],
    ["A1", "B1"], ["B1", "C1"], ["C1", "D1"],
    ["A2", "B2"], ["B2", "C2"], ["C2", "D2"],
    ["A3", "B3"], ["B3", "C3"], ["C3", "D3"],
    ["A4", "B4"], ["B4", "C4"], ["C4", "D4"]]
    # @possible_large_responses = [["A1", "A2", "A3"], ["A2", "A3", "A4"], ["B1", "B2", "B3"], ["B2", "B3", "B4"], ["C1", "C2", "C3"], ["C2", "C3", "C4"], ["D1", "D2", "D3"], ["D2", "D3", "D4"], ["A1", "B1", "C1"], ["B1", "C1", "D1"], ["A2", "B2", "C2"], ["B2", "C2", "D2"], ["A3", "B3", "C3"], ["B3", "C3", "D3"], ["A4", "B4", "C4"], ["B4", "C4", "D4"]]

  def possible_small_responses
    psr = []
    doubles = []
    new_coordinates = []

    first = ["A", "B", "C", "D"]
    second = ["1" , "2", "3", "4"]
    first.map do |letter| #A
      second.each do |num|
        psr <<  [letter + num]
      end
    end
    psr # [["A1"], ["A2"], ["A3"], ["A4"], ["B1"], ["B2"], ["B3"], ["B4"], ["C1"], ["C2"], ["C3"], ["C4"], ["D1"], ["D2"], ["D3"], ["D4"]]
    psr.map do |single_coordinate|
      if new_coordinates.length.even? && doubles.length.even?
        doubles << single_coordinate #doubles is always going to be A!
      elsif new_coordinates.length.even? && doubles.length < 3
        doubles << single_coordinate #doubles is always going to be A!
      else
        new_coordinates << [doubles + single_coordinate].flatten
      end
    end
       new_coordinates
    # psr << [first[0]+ second[0], first[0]+ second[1]]
    # psr << [first[0]+ second[1], first[0]+ second[2]]
    # psr << [first[0]+ second[2], first[0]+ second[3]]
    #
    # first[1] + second[0]
    # first[1] + second[1]
    # first[1] + second[2]
    # first[1] + second[3]
    # psr
  end


end
