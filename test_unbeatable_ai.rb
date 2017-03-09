require "minitest/autorun"
require_relative "unbeatable_ai.rb"
require_relative "board.rb"

class TestUnbeatableAI < Minitest::Test
	def test_new_ai
		ai1 = Unbeatable_ai.new
		result = ["X", "X", "X", "X"]
		assert_equal(result, ai1.create)
	end

	def test_pick_spot_step_1
		board = Board.new
		ai1 = Unbeatable_ai.new
		board.setup = ["X", "X", "", "", "", "", "", "", ""]
		result = ["X", "X", "X", "", "", "", "", "", ""]
		assert_equal(result, ai1.pick_spot(board))
	end
end