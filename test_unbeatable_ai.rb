require "minitest/autorun"
require_relative "unbeatable_ai.rb"
require_relative "board.rb"
require_relative "game.rb"

class TestUnbeatableAI < Minitest::Test
	def test_new_ai
		ai1 = Unbeatable_ai.new
		result = ["X", "X", "X", "X", "X"]
		assert_equal(result, ai1.create)
	end

	def test_pick_spot_step_1
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
		result = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
		ai1.pick_spot(board, "O")
		assert_equal(result, board.setup)
	end

	def test_pick_spot_step_1_2
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = [" ", " ", " ", " ", " ", " ", "X", " ", "X"]
		result = [" ", " ", " ", " ", " ", " ", "X", "X", "X"]
		ai1.pick_spot(board, "O")
		assert_equal(result, board.setup)
	end

	def test_pick_spot_step_2
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = ["O", " ", "O", " ", " ", "X", " ", " ", "X"]
		result = ["O", "X", "O", " ", " ", "X", " ", " ", "X"]
		ai1.pick_spot(board, "O")
		assert_equal(result, board.setup)
	end

	def test_pick_spot_step_2_2
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = [" ", "X", " ", "O", "O", " ", " ", " ", "X"]
		result = [" ", "X", " ", "O", "O", "X", " ", " ", "X"]
		ai1.pick_spot(board, "O" )
		assert_equal(result, board.setup)
	end

	def test_pick_spot_step_3
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = ["X", " ", " ", " ", "O", " ", "O", " ", "X"]
		result = ["X", " ", "X", " ", "O", " ", "O", " ", "X"]
		ai1.pick_spot(board, "O")
		assert_equal(result, board.setup)
	end

	def test_pick_spot_step_3_2
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = [" ", "X", " ", " ", "O", " ", " ", "O", "X"]
		result = [" ", "X", "X", " ", "O", " ", " ", "O", "X"]
		ai1.pick_spot(board, "O")
		assert_equal(result, board.setup)
	end	

	def test_pick_spot_step_4_1
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		game = Game.new
		game.change_markers(ai1)
		board.setup = ["X", " ", " ", " ", "O", " ", " ", " ", "X"]
		result = ["X", " ", " ", " ", "O", " ", " ", "O", "X"]
		ai1.pick_spot(board, "X")
		assert_equal(result, board.setup)
	end

	def test_pick_spot_step_4_2
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		game = Game.new
		game.change_markers(ai1)
		board.setup = ["X", " ", " ", " ", "O", " ", " ", "X", " "]
		result = ["X", " ", " ", " ", "O", " ", "O", "X", " "]
		ai1.pick_spot(board, "X")
		assert_equal(result, board.setup)
	end

	def test_pick_center
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
		result = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
		ai1.pick_spot(board, "O")
		assert_equal(result, board.setup)
	end

	def test_pick_opposite_corner
		board = Board.new
		ai1 = Unbeatable_ai.new
		game = Game.new
		ai1.turn = true
		game.change_markers(ai1)
		board.setup = ["X", " ", " ", " ", "X", " ", " ", " ", " "]
		result = ["X", " ", " ", " ", "X", " ", " ", " ", "O"]
		ai1.pick_spot(board, "X")
		assert_equal(result, board.setup)
	end

	def test_pick_opposite_corner_2
		board = Board.new
		ai1 = Unbeatable_ai.new
		game = Game.new
		ai1.turn = true
		game.change_markers(ai1)
		board.setup = [" ", " ", "X", " ", "X", " ", " ", " ", " "]
		result = [" ", " ", "X", " ", "X", " ", "O", " ", " "]
		ai1.pick_spot(board, "X")
		assert_equal(result, board.setup)
	end

	def test_pick_corner
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = ["O", " ", " ", " ", "O", " ", " ", " ", "O"]
		result = ["O", " ", "X", " ", "O", " ", " ", " ", "O"]
		ai1.pick_spot(board, "O")
		assert_equal(result, board.setup)
	end

	def test_pick_side
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		board.setup = ["O", " ", "O", " ", "O", " ", "O", " ", "O"]
		result = ["O", " ", "O", " ", "O", "X", "O", " ", "O"]
		ai1.pick_spot(board, "O")
		assert_equal(result, board.setup)
	end

	def test_weird_case
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		ai1.create = ["O", "O", "O", "O"]
		board.setup = [" ", "X", " ", " ", "O", " ", " ", " ", "X"]
		result = [" ", "X", "O", " ", "O", " ", " ", " ", "X"]
		ai1.pick_spot(board, "X")
		assert_equal(result, board.setup)
	end

	def test_weird_case_2
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		ai1.create = ["O", "O", "O", "O"]
		board.setup = [" ", " ", " ", "X", " ", " ", " ", " ", " "]
		result = [" ", " ", " ", "X", "O", " ", " ", " ", " "]
		ai1.pick_spot(board, "X")
		assert_equal(result, board.setup)
	end

	def test_weird_case_3
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		ai1.create = ["O", "O", "O", "O"]
		board.setup = [" ", " ", " ", " ", "O", "X", " ", "X", " "]
		result = [" ", " ", " ", " ", "O", "X", " ", "X", "O"]
		ai1.pick_spot(board, "X")
		assert_equal(result, board.setup)
	end

	def test_weird_case_4
		board = Board.new
		ai1 = Unbeatable_ai.new
		ai1.turn = true
		ai1.create = ["O", "O", "O", "O"]
		board.setup = [" ", " ", "O", "O", "X", " ", "X", " ", " "]
		result = [" ", " ", " ", " ", "O", "X", " ", "X", "O"]
		ai1.pick_spot(board, "X")
		assert_equal(result, board.setup)
	end
end