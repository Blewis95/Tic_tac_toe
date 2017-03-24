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
			# print "1"
		end

		if @turn == true
			check_block(board, player2_marker)
			# print "2"
		end

		if @turn == true
			check_fork(board, @create[0])
			# print "3"
		end

		if @turn == true
			check_fork_enemy(board, player2_marker)
			# print "4"
		end

		if @turn == true
			check_center(board)
		end

		if @turn == true
			check_opp_corner(board, player2_marker)
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

			# print option

			if counter_possibility == 2

				same = option[0]&option[1]
				same = same[0]

				if board.setup[same] == " "
					@counter = same
					@turn = false
				end

			end
		
	end

	def check_fork_enemy(board, marker)

		winning = [[0,1,2], [3,4,5], [0,3,6], [6,7,8], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

		
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
			
			# print counter_possibility

			if counter_possibility == 2

				same = option[0]&option[1]
				same = same[0]
				@counter = same
				@turn = false

			elsif counter_possibility == 3

				shared_positions = Array.new

				shared_positions.push(option[0]&option[1])
				shared_positions.push(option[0]&option[2])
				shared_positions.push(option[1]&option[2])

				shared_positions.flatten!

				if (board.setup[shared_positions[0]] == " ")
					@counter = shared_positions[0]
					@turn = false

				elsif (board.setup[shared_positions[1]] == " ")
					@counter = shared_positions[1]
					@turn = false

				elsif (board.setup[shared_positions[2]] == " ")
					@counter = shared_positions[2]
					@turn = false
				end

			elsif counter_possibility == 4

				shared_positions = Array.new

				shared_positions.push(option[0]&option[1])
				shared_positions.push(option[0]&option[2])
				shared_positions.push(option[0]&option[3])
				shared_positions.push(option[1]&option[2])
				shared_positions.push(option[1]&option[3])
				shared_positions.push(option[2]&option[3])


				shared_positions.flatten!

				# print shared_positions

				if (board.setup[shared_positions[0]] == " ")
					@counter = shared_positions[0]
					@turn = false

				elsif (board.setup[shared_positions[1]] == " ")
					@counter = shared_positions[1]
					@turn = false

				elsif (board.setup[shared_positions[2]] == " ")
					@counter = shared_positions[2]
					@turn = false

				elsif (board.setup[shared_positions[3]] == " ")
					@counter = shared_positions[3]
					@turn = false

				elsif (board.setup[shared_positions[4]] == " ")
					@counter = shared_positions[4]
					@turn = false

				elsif (board.setup[shared_positions[5]] == " ")
					@counter = shared_positions[5]
					@turn = false
				end

			end
	end

	def check_center(board)
		if (@turn == true) && (board.setup[4] == " ")
			@counter = 4
			@turn = false
		end
	end

	def check_opp_corner(board, marker)
		if @turn == true
			if board.setup[0] == marker
				@counter = 8
				@turn = false
			elsif board.setup[2] == marker
				@counter = 6
				@turn = false
			elsif board.setup[6] == marker
				@counter = 2
				@turn = false
			elsif board.setup[8] == marker
				@counter = 0
				@turn = false
			end
		end
	end
end