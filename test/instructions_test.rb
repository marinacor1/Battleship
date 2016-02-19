require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/instructions'

class InstructionsTest < Minitest::Test
  def test_instructions_creates_instance_of_instructions
    i = Instructions.new
    i.instance_of? Instructions
  end

end
