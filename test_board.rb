require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test
	def test_for_board
		board = Board.new
		result = Array.new(9, "")
		assert_equal(result, board.setup)
	end

	def test_update_board
		board = Board.new
		board.set_position(0, "X")
		result = Array.new(9, "")
		result[0] = "X"
		assert_equal(result, board.setup)
	end

	def test_5th_pos_equals_o
		board = Board.new
		board.set_position(0, "X")
		result = Array.new(9, "")
		result[0] = "X"
		board.set_position(4, "O")
		result[4] = "O"
		assert_equal(result, board.setup)
	end

	def test_8th_pos_equals_x
		board = Board.new
		board.setup = ["X", "", "", "", "O", "", "", "", ""]
		board.set_position(7, "X")
		result = ["X", "", "", "", "O", "", "", "X", ""]
		assert_equal(result, board.setup)

	end
end