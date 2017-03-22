require "minitest/autorun"
require_relative "unbeatable_ai.rb"
require_relative "board.rb"

class TestUnbeatableAI < Minitest::Test
	# def test_new_ai
	# 	ai1 = Unbeatable_ai.new
	# 	result = ["X", "X", "X", "X"]
	# 	assert_equal(result, ai1.create)
	# end

	# def test_pick_spot_step_1
	# 	board = Board.new
	# 	ai1 = Unbeatable_ai.new
	# 	ai1.turn = true
	# 	board.setup = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
	# 	result = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
	# 	ai1.pick_spot(board)
	# 	assert_equal(result, board.setup)
	# end

	# def test_pick_spot_step_1_2
	# 	board = Board.new
	# 	ai1 = Unbeatable_ai.new
	# 	ai1.turn = true
	# 	board.setup = [" ", " ", " ", " ", " ", " ", "X", " ", "X"]
	# 	result = [" ", " ", " ", " ", " ", " ", "X", "X", "X"]
	# 	ai1.pick_spot(board)
	# 	assert_equal(result, board.setup)
	# end

	# def test_pick_spot_step_2
	# 	board = Board.new
	# 	ai1 = Unbeatable_ai.new
	# 	ai1.turn = true
	# 	board.setup = ["O", " ", "O", " ", " ", "X", " ", " ", "X"]
	# 	result = ["O", "X", "O", " ", " ", "X", " ", " ", "X"]
	# 	ai1.pick_spot(board)
	# 	assert_equal(result, board.setup)
	# end

	# def test_pick_spot_step_2_2
	# 	board = Board.new
	# 	ai1 = Unbeatable_ai.new
	# 	ai1.turn = true
	# 	board.setup = [" ", "X", " ", "O", "O", " ", " ", " ", "X"]
	# 	result = [" ", "X", " ", "O", "O", "X", " ", " ", "X"]
	# 	ai1.pick_spot(board)
	# 	assert_equal(result, board.setup)
	# end

	# def test_pick_spot_step_3
	# 	board = Board.new
	# 	ai1 = Unbeatable_ai.new
	# 	ai1.turn = true
	# 	board.setup = ["X", " ", " ", " ", "O", " ", "O", " ", "X"]
	# 	result = ["X", " ", "X", " ", "O", " ", "O", " ", "X"]
	# 	ai1.pick_spot(board)
	# 	assert_equal(result, board.setup)
	# end

	def test_pick_spot_step_3_2
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = [" ", "X", " ", " ", "O", " ", " ", "O", "X"]
		result = [" ", "X", "X", " ", "O", " ", " ", "O", "X"]
		ai1.pick_spot(board)
		assert_equal(result, board.setup)
	end	
end