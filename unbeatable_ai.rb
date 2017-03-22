class Unbeatable_ai
	attr_accessor :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X"]
		@counter = 0
		@turn = false
	end

	def pick_spot(board)

		if @turn == true
			check_win(board)
		end

		if @turn == true
			check_fork(board)
		end

		print @counter

		if board.check_position?(@counter) == true
			board.set_position(@counter, @create.pop)
		end

		return board

	end


	def check_win(board) #step 1 (win) and step 2 (block)
		markers = ["X", "O"]

		winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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
								@turn = false
							end
						end
						
					end
				end
			end
		end
	end
	
	def check_fork(board)
		markers = ["X", "O"]

		winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

		markers.each do |mark|
			counter_possibility = 0
			option = Array.new
			winning.each do |combos|
				counter_taken = 0
				counter_empty = 0
				combos.each do |spot|
					if (board.setup[spot] == mark)
						counter_taken += 1
					elsif (board.setup[spot] == " ")
						counter_empty += 1
					end
				end

				if (counter_taken == 1) && (counter_empty == 2)
					counter_possibility += 1
					option.push(combos)
				end
			end

			if counter_possibility == 2
				option.each do |things|
					# print things
					# print "\n"

					things.each do |x|
						if board.setup[x] == " "
							@counter = x
							@turn = false
						end
					end
				end
				# print "\n"
			end
		end
	end
	
end