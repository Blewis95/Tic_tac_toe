require "minitest/autorun"
require_relative "random_ai.rb"
require_relative "board.rb"

class TestRandomAI < Minitest::Test
	def test_new_ai
		ai1 = Random.new
		result = ["X", "X", "X", "X"]
		assert_equal(result, ai1.create)
	end

	def test_pick_spot
		board = Board.new
		ai1 = Random.new
		result = board.setup.count("X")
		assert_equal()
	end
end