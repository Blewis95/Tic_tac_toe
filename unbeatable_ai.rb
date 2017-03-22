class Unbeatable_ai
	attr_accessor :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X"]
		@counter = 0
		@turn = false
	end

	def pick_spot(board, player2_marker)

		if @turn == true
			check_win(board, @create[0])
		end

		if @turn == true
			check_block(board, player2_marker)
		end

		if @turn == true
			check_fork(board, @create[0])
			
		end

		# print @counter

		if board.check_position?(@counter) == true
			board.set_position(@counter, @create.pop)
		end

		return board

	end


	def check_win(board, marker) #step 1 (win)

		winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

		
			winning.each do |combos|
				matches = 0
				combos.each do |spot|
					if board.setup[spot] == marker
						matches += 1
					end
				
					if matches == 2
						combos.each do |spot|
							if (board.setup[spot] == " ")
								@counter = spot
								@turn = false
							end
						end
						
					end
				end
			end
	end

	def check_block(board, marker)
		winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

		
			winning.each do |combos|
				matches = 0
				combos.each do |spot|
					if board.setup[spot] == marker
						matches += 1
					end
				
					if matches == 2
						combos.each do |spot|
							if (board.setup[spot] == " ")
								@counter = spot
								@turn = false
							end
						end
						
					end
				end
			end
	end
	
	def check_fork(board, marker)

		winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

		
			counter_possibility = 0
			option = Array.new
			winning.each do |combos|
				counter_taken = 0
				counter_empty = 0
				combos.each do |spot|
					if (board.setup[spot] == marker)
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

				same = option[0]&option[1]
				same = same[0]
				@counter = same
				@turn = false

			end
		
	end
	
end