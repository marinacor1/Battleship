require 'pry'

class ComputerPlay
  attr_reader :possible_small_responses, :possible_large_responses
  attr_accessor :computer_placement

  def initialize
    @possible_small_responses= [["A1", "A2"], ["A2", "A3"], ["A3", "A4"], ["B1", "B2"], ["B2", "B3"], ["B3", "B4"], ["C1", "C2"], ["C2", "C3"], ["C3", "C4"], ["D1", "D2"], ["D2", "D3"], ["D3", "D4"], ["A1", "B1"], ["B1", "C1"], ["C1", "D1"], ["A2", "B2"], ["B2", "C2"], ["C2", "D2"], ["A3", "B3"], ["B3", "C3"], ["C3", "D3"], ["A4", "B4"], ["B4", "C4"], ["C4", "D4"]]
    @possible_large_responses = [["A1", "A2", "A3"], ["A2", "A3", "A4"], ["B1", "B2", "B3"], ["B2", "B3", "B4"], ["C1", "C2", "C3"], ["C2", "C3", "C4"], ["D1", "D2", "D3"], ["D2", "D3", "D4"], ["A1", "B1", "C1"], ["B1", "C1", "D1"], ["A2", "B2", "C2"], ["B2", "C2", "D2"], ["A3", "B3", "C3"], ["B3", "C3", "D3"], ["A4", "B4", "C4"], ["B4", "C4", "D4"]]
    @possible_shots = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @computer_placement = []
  end

  def computer_generated_ship_placement
    @computer_placement << @possible_small_responses[rand(0..23)]
    @possible_new_large_responses = @possible_large_responses.reject do |coordinates|
      coordinates.include?(@computer_placement.flatten[0]) || coordinates.include?(@computer_placement.flatten[1])
    end
    @computer_placement << @possible_new_large_responses[rand(0..11)]
    @computer_placement.flatten
  end

  def computer_shot
    shot = @possible_shots[rand(0..15)]
    @possible_shots.delete_at(shot.to_i)
    shot
  end
end
