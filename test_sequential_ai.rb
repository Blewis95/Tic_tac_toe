require "minitest/autorun"
require_relative "sequential_ai.rb"
require_relative "board.rb"

class TestSequentialAI < Minitest::Test
	def test_new_ai
		ai1 = Sequential.new
		result = ["X", "X", "X", "X", "X"]
		assert_equal(result, ai1.create)
	end

	def test_pick_spot
		board = Board.new
		ai1 = Sequential.new
		ai1.turn = true
		result = ["X", "", "", "", "", "", "", "", ""]
		ai1.pick_spot(board)
		assert_equal(result, board.setup)
	end

	def test_pick_full_spot
		board = Board.new
		ai1 = Sequential.new
		ai1.turn = true
		board.set_position(0, "O")
		result = ["O", "X", "", "", "", "", "", "", ""]
		ai1.pick_spot(board)
		assert_equal(result, board.setup)
	end

	def test_2_full_spots
		board = Board.new
		ai1 = Sequential.new
		ai1.turn = true
		board.set_position(0, "O")
		board.set_position(1, "O")
		result = ["O", "O", "X", "", "", "", "", "", ""]
		ai1.pick_spot(board)
		assert_equal(result, board.setup)
	end

end