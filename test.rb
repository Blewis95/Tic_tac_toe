require_relative "unbeatable_ai.rb"
require_relative "board.rb"
require_relative "game.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"

ai1_win = 0
ai2_win = 0
tie_game = 0

10000.times do |x| #unbeatable v unbeatable

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

puts "unbeatable1 wins : #{ai1_win}"
puts "unbeatable2 wins : #{ai2_win}"
puts "ties : #{tie_game}"

puts "\n"


ai1_win = 0
ai2_win = 0
tie_game = 0

10000.times do |x| #unbeatable v unbeatable

	ai1 = Random_ai.new
	ai2 = Unbeatable_ai.new
	board = Board.new
	game = Game.new

	ai1.turn = true
	game.change_markers(ai2)

	while board.check_full? == false

		ai1.pick_spot(board)

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

puts "random1 wins : #{ai1_win}"
puts "unbeatable2 wins : #{ai2_win}"
puts "ties : #{tie_game}"

puts "\n"


ai1_win = 0
ai2_win = 0
tie_game = 0

10000.times do |x| #unbeatable v unbeatable

	ai1 = Sequential.new
	ai2 = Unbeatable_ai.new
	board = Board.new
	game = Game.new

	ai1.turn = true
	game.change_markers(ai2)

	while board.check_full? == false

		ai1.pick_spot(board)

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

puts "sequential1 wins : #{ai1_win}"
puts "unbeatable2 wins : #{ai2_win}"
puts "ties : #{tie_game}"

puts "\n"

ai1_win = 0
ai2_win = 0
tie_game = 0

10.times do |x| #unbeatable v random

	ai1 = Unbeatable_ai.new
	ai2 = Random_ai.new
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

		ai2.pick_spot(board)

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

puts "unbeatable1 wins : #{ai1_win}"
puts "sequential2 wins : #{ai2_win}"
puts "ties : #{tie_game}"

puts "\n"