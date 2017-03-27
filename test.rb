require_relative "unbeatable_ai.rb"
require_relative "board.rb"
require_relative "game.rb"

ai1 = Unbeatable_ai.new
ai2 = Unbeatable_ai.new
board = Board.new
game = Game.new

ai1_win = 0
ai2_win = 0
tie_game = 0

10.times do |x|

	ai1.turn = true
	game.change_markers(ai2)

	while board.check_full? == false

		ai1.pick_spot(board, ai2.create[0])

		board.print_board

		if board.check_win? == true
			ai1_win += 1
			break
		elsif board.check_full? == true
			tie_game += 1
		end

		game.change_turn(ai1, ai2)

		ai2.pick_spot(board, ai1.create[0])

		board.print_board

		if board.check_win? == true
			ai2_win += 1
			break
		end

		game.change_turn(ai1, ai2)

	end

	if board.check_win? == false
		tie_game += 1
	end

end

puts ai1_win
puts ai2_win
puts tie_game