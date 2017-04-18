require_relative "board.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "game.rb"
require_relative "player.rb"
require_relative "Unbeatable_ai.rb"

board = Board.new
game = Game.new
ai1 = String
ai2 = String

puts "Welcome to Tic Tac Toe"
puts "Player types: Sequential = S, Random = R, Player = P, Unbeatable = U"

begin
	print "Please enter AI type for player 1: "
	ai1 = gets.chomp

	if ai1.upcase == "S"
		player1 = Sequential.new
	elsif ai1.upcase == "R"
		player1 = Random_ai.new
	elsif ai1.upcase == "P"
		player1 = Player.new
	elsif ai1.upcase == "U"
		player1 = Unbeatable_ai.new
	else
		puts "Error, incorrect input"
	end
end while (ai1.upcase != "S") && (ai1.upcase != "R") && (ai1.upcase != "P") && (ai1.upcase != "U")


begin
	print "Please enter AI type for player 2: "
	ai2 = gets.chomp

	if ai2.upcase == "S"
		player2 = Sequential.new
	elsif ai2.upcase == "R"
		player2 = Random_ai.new
	elsif ai2.upcase == "P"
		player2 = Player.new
	elsif ai2.upcase == "U"
		player2 = Unbeatable_ai.new
	else
		puts "Error, incorrect input"
	end
end while (ai2.upcase != "S") && (ai2.upcase != "R") && (ai2.upcase != "P") && (ai2.upcase != "U")

# puts player1
# puts player2
player1.turn = true
game.change_markers(player2)

# puts player1.counter

while board.check_full? == false

	if ai1.upcase == "U"
		player1.pick_spot(board, "O")
	else
		player1.pick_spot(board)
	end

	board.print_board

	if board.check_win? == true
		puts "Player 1 wins!"
		break
	end

	player1.turn = false
	player2.turn = true

	if ai2.upcase == "U"
		player2.pick_spot(board, "X")
	else
		player2.pick_spot(board)
	end

	board.print_board

	if board.check_win? == true
		puts "Player 2 wins!"
		break
	end

	player2.turn = false
	player1.turn = true

end

if board.check_win? == false
	puts "It's a Tie!"
end