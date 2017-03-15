require_relative "board.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "game.rb"

board = Board.new
game = Game.new
ai1 = String
ai2 = String

puts "Welcome to Tic Tac Toe"
puts "Player types: Sequential = S, Random = R"

begin
	print "Please enter AI type for player 1: "
	ai1 = gets.chomp

	if ai1.upcase == "S"
		player1 = Sequential.new
	elsif ai1.upcase == "R"
		player1 = Random_ai.new
	# elsif ai1.upcase == "P"
	# 	ai1 = Player.new
	else
		puts "Error, incorrect input"
	end
end while (ai1.upcase != "S") && (ai1.upcase != "R")


begin
	print "Please enter AI type for player 2: "
	ai2 = gets.chomp

	if ai2.upcase == "S"
		player2 = Sequential.new
	elsif ai2.upcase == "R"
		player2 = Random_ai.new
	# elsif ai2.upcase == "P"
	# 	ai2 = Player.new
	else
		puts "Error, incorrect input"
	end
end while (ai1.upcase != "S") && (ai1.upcase != "R")

# puts player1
# puts player2

player1.turn = true
game.change_markers(player2)

# puts player1.counter

while board.check_full? == false
	
	player1.pick_spot(board)

	board.print_board

	if board.check_win? == true || board.check_full? == true
		break
	end

	game.change_turn(player1, player2)

	player2.pick_spot(board)

	board.print_board

	if board.check_win? == true
		break
	end

	game.change_turn(player1, player2)
end

if board.check_win? == false
	puts "It's a Tie!"
end