require "minitest/autorun"
require_relative "player.rb"
require_relative "board.rb"

class TestPlayer < Minitest::Test
	def test_new_player
		player1 = Player.new
		result = ["X", "X", "X", "X", "X"]
		assert_equal(result, player1.create)
	end

	def test_pick_spot
		board = Board.new
		player1 = Player.new
		result = true
		player1.turn = true
		player1.pick_spot(board)
		assert_equal(result, board.setup.include?("X"))
	end
end