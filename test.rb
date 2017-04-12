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

10000.times do |x| #random v unbeatable

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
			board.print_board
			break
		end

		ai1.turn = false
		ai2.turn = true

		# puts ai1.create[0]
		ai2.pick_spot(board, "X")

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

10000.times do |x| #unbeatable v random

	ai1 = Unbeatable_ai.new
	ai2 = Random_ai.new
	board = Board.new
	game = Game.new

	ai1.turn = true
	game.change_markers(ai2)

	switcher = 0
	ai1_won = false
	ai2_won = false

	# puts "board.check_full?: #{board.check_full?}"

	while (board.check_full? == false) && (ai1_won == false) && (ai2_won == false)

		# print "Hello"
		if switcher == 0

			ai1.pick_spot(board, "O")

			# board.print_board

			if board.check_win? == true
				ai1_win += 1
				ai1_won = true
				# board.print_board
				
			end

			ai1.turn = false
			ai2.turn = true
			switcher = 1

		else

			# puts ai1.create[0]
			ai2.pick_spot(board)

			# board.print_board

			if board.check_win? == true
				ai2_win += 1
				ai2_won = true
			end


			ai2.turn = false
			ai1.turn = true
			switcher = 0

		end

		# puts "board.check_full?: #{board.check_full?}"

	end

	if (board.check_win? == false)
		tie_game += 1

	end

end

puts "unbeatable1 wins : #{ai1_win}"
puts "random2 wins : #{ai2_win}"
puts "ties : #{tie_game}"

puts "\n"

ai1_win = 0
ai2_win = 0
tie_game = 0

10000.times do |x| #sequential v unbeatable

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

10000.times do |x| #unbeatable v sequential

	ai1 = Unbeatable_ai.new
	ai2 = Sequential.new
	board = Board.new
	game = Game.new

	ai1.turn = true
	game.change_markers(ai2)

	switcher = 0
	ai1_won = false
	ai2_won = false

	while (board.check_full? == false) && (ai1_won == false) && (ai2_won == false)


		if switcher == 0

			ai1.pick_spot(board, "O")

			# board.print_board

			if board.check_win? == true
				ai1_win += 1
				ai1_won = true
				# board.print_board
				
			end

			ai1.turn = false
			ai2.turn = true
			switcher = 1

		else

			# puts ai1.create[0]
			ai2.pick_spot(board)

			# board.print_board

			if board.check_win? == true
				ai2_win += 1
				ai2_won = true
			end


			ai2.turn = false
			ai1.turn = true
			switcher = 0

		end
	end

	if board.check_win? == false
		tie_game += 1
	end


end

puts "unbeatable1 wins : #{ai1_win}"
puts "sequential2 wins : #{ai2_win}"
puts "ties : #{tie_game}"

puts "\n"

