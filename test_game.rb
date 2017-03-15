require "minitest/autorun"
require_relative "board.rb"
require_relative "sequential_ai.rb"
require_relative "random_ai.rb"
require_relative "game.rb"

class TestGame < Minitest::Test
	def test_new_game
		game = Game.new
		board = Board.new
		player1 = Random_ai.new
		player2 = Random_ai.new
		player1.turn = true
		game.change_markers(player2)
		assert_equal(["X", "X", "X", "X", "X"],player1.create)
		assert_equal(["O","O","O","O"],player2.create)
	end

	def test_change_turn
		game = Game.new
		board = Board.new
		player1 = Random_ai.new
		player2 = Random_ai.new
		player1.turn = true
		player2.turn = false
		game.change_markers(player2)
		game.change_turn(player1,player2)

		assert_equal(true, player2.turn)
		assert_equal(false, player1.turn)
	end

	def test_first_turn_random
		game = Game.new
		board = Board.new
		player1 = Random_ai.new
		player2 = Random_ai.new
		player1.turn = true
		player2.turn = false
		game.change_markers(player2)

		#puts board.setup.include?("X")	#should be false

		player1.pick_spot(board)
		game.change_turn(player1, player2)
		result = board.setup.include?("X")

		assert_equal(true, result)
	end

	def test_first_turn_sequential
		game = Game.new
		board = Board.new
		player1 = Sequential.new
		player2 = Sequential.new
		player1.turn = true
		player2.turn = false
		game.change_markers(player2)

		player1.pick_spot(board)
		game.change_turn(player1, player2)
		result = board.setup.include?("X")

		assert_equal(true, result)
	end
end