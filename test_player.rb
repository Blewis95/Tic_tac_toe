require "minitest/autorun"
require_relative "player.rb"
require_relative "board.rb"

class TestPlayer < Minitest::Test
	def test_new_player
		player1 = Player.new
		result = ["X", "X", "X", "X", "X"]
		assert_equal(result, player1.create)
	end
end