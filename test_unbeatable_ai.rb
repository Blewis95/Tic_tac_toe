require "minitest/autorun"
require_relative "unbeatable_ai.rb"
require_relative "board.rb"

class TestUnbeatableAI < Minitest::Test
	def test_new_ai
		ai1 = Unbeatable_ai.new
		result = ["X", "X", "X", "X"]
		assert_equal(result, ai1.create)
	end
end