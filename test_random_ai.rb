require "minitest/autorun"
require_relative "random_ai.rb"
require_relative "board.rb"

class TestRandomAI < Minitest::Test
	def test_new_ai
		ai1 = Random_ai.new
		result = ["X", "X", "X", "X"]
		assert_equal(result, ai1.create)
	end

	def test_pick_spot
		board = Board.new
		ai1 = Random_ai.new
		result = true
		ai1.pick_spot(board)
		assert_equal(result , board.setup.include?("X"))
	end

	def test_pick_full_spot
		board = Board.new
		ai1 = Random_ai.new
		board.set_position(0, "O")
		ai1.counter = 0
		ai1.pick_spot(board)
		result = true
		print board.setup
		assert_equal(result, board.setup.include?("X"))
	end
end