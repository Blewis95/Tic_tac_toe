require_relative "board.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"

class Game
	
	def initialize
		
	end

	def change_markers(player2)
		player2.create = ["O", "O", "O", "O"]
	end

	def change_turn(player1, player2)
		if player1.turn == true || player2.turn == false
			player1.turn = false
			player2.turn = true
		elsif player2.turn == true || player1.turn == false
			player1.turn = true
			player2.turn = false
		end
	end

end