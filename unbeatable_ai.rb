class Unbeatable_ai
	attr_accessor :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X"]
		@counter = 0
		@turn = false
	end

	def pick_spot(board)

		check_win?(board)

		# if board.check_position?(@counter) == true
			board.set_position(@counter, @create.pop)
		# end

		return board

	end


def check_win?(board)
		markers = ["X", "O"]

		winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

		winner = false

		markers.each do |mark|
			winning.each do |combos|
				matches = 0
				combos.each do |spot|
					if board.setup[spot] == mark
						matches += 1
					end
				
					if matches == 2
						combos.each do |spot|
							if (board.setup[spot] != mark)
								@counter = spot
							end
						end
						
					end
				end
			end
		end
	end
	# def check_win?(board)
	# 	winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
	# 	counter = 0


	# 	winning.each do |option|
	# 		option.each do |spot|
	# 			# if board.setup[spot] == "X"
	# 			# 	counter += 1
	# 			# 	if counter == 2
	# 			# 		if board.setup[winning[option].index]
	# 			# 	end
	# 			# end
	# 		end
	# 	end
	# end
end