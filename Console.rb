require_relative "unbeatable_ai.rb"
require_relative "board.rb"
require_relative "game.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "player.rb"

class Console
	attr_accessor :board, :player1, :player2, :currentplayer

	def initialize(player1, player2)
		@board = Board.new
		@player1 = player1
		@player2 = player2
		@current_player = player1
	end

	def get_move
		if current_player.class == 'Unbeatable_ai' && current_player == player1
			current_player.pick_spot(@board, "o")
		elsif current_player.class == 'Unbeatable_ai' && current_player == player2
			current_player.pick_spot(@board, "x")
		else
			current_player.pick_spot(board)
		end

	end

	def make_move(counter)
		board.set_position(counter,current_player.create[0])
	end

	def change_player
		if current_player == player1
			@current_player = player2
		else 
			@current_player = player1 
		end
	end

	def game_over?
		board.check_win?
	end

end