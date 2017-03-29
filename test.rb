require_relative "unbeatable_ai.rb"
require_relative "board.rb"
require_relative "game.rb"

ai1_win = 0
ai2_win = 0
tie_game = 0

10000.times do |x|

	ai1 = Unbeatable_ai.new
	ai2 = Unbeatable_ai.new
	board = Board.new
	game = Game.new

	ai1.turn = true
	game.change_markers(ai2)

	while board.check_full? == false

		ai1.pick_spot(board, ai2.create[0])

		#board.print_board

		if board.check_win? == true
			ai1_win += 1
			break
		end

		ai1.turn = false
		ai2.turn = true

		ai2.pick_spot(board, ai1.create[0])

		#board.print_board

		if board.check_win? == true
			ai2_win += 1
			break
		end

		ai2.turn = false
		ai1.turn = true

	end

	if board.check_win? == false
		tie_game += 1
	end

end

puts ai1_win
puts ai2_win
puts tie_game