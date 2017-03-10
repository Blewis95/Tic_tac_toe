require "minitest/autorun"
require_relative "board.rb"
require_relative "sequential_ai.rb"
require_relative "random_ai.rb"

class TestGame < Minitest::Test
	def test_new_game
		board = Board.new
		player1 = Random_ai.new
		player2 = Random_ai.new
		assert_equal()
	end
end