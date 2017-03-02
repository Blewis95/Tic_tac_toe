require "minitest/autorun"
require_relative "sequential_ai.rb"

class TestSequentialAI < Minitest::Test
	def test_new_ai
		ai1 = Sequential.new
		result = ["X", "X", "X", "X"]
		assert_equal(result, ai1.create)
	end
end