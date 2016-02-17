class ComputerPlay
  attr_reader :possible_responses
  attr_accessor :guess

  def initialize
    @possible_responses = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    @guess = []
  end

  def initial_computer_ship_setup
    5. times do
      @guess << @possible_responses.shuffle!.pop
    end
    @guess
  end


end
