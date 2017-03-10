require_relative "board.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"


board = Board.new

puts "Welcome to Tic Tac Toe"
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

# puts player1
# puts player2

while board.check_win? == false do
	if turn == 1

		puts "Player 1 it's your turn!"
		print "pick a spot between 0-8"
		p1_spot = gets.chomp

		if board.check_position?(p1_spot) == true
			board.set_position(p1_spot)
		else
			puts "Spot it full!"
		end
	else
		puts "Player 2 it's your turn!"
		print "pick a spot between 0-8"
		p2_spot = gets.chomp

		if board.check_position?(p2_spot) == true
			board.set_position(p2_spot)
		else
			puts "Spot it full!"
		end
	end

end