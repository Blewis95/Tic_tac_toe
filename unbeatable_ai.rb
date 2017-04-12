require_relative "board.rb"


class Unbeatable_ai
	attr_accessor :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X", "X"]
		@counter = 1
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
			# print "5"
		end

		if @turn == true
			check_opp_corner(board, player2_marker)
			# print "6"
		end

		if @turn == true
			check_corner(board)
			# print "7"
		end

		if @turn == true
			check_side(board)
			# print "8"
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

			# print "option: #{option}"

			if counter_possibility == 2

				same = option[0]&option[1]
				same = same[0]

				if board.setup[same] == " "
					@counter = same
					@turn = false
				end

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

			end
		
	end

	def check_fork_enemy(board, marker)

		winning = [[0,1,2], [3,4,5], [0,3,6], [6,7,8], [1,4,7], [2,5,8], [2,4,6], [0,4,8]]
		
			counter_possibility = 0
			counter_pos = 0
			counter_empty_arrays = 0
			option = Array.new
			option1 = Array.new
			empty_op = Array.new
			winning.each do |combos|
				counter_taken_opp = 0
				counter_taken = 0
				counter_empty = 0
				combos.each do |spot|
					if (board.setup[spot] == marker)
						counter_taken_opp += 1
					elsif (board.setup[spot] == " ")
						counter_empty += 1
					elsif (board.setup[spot] == @create[0])
						counter_taken += 1
					end
				end

				if (counter_taken == 1) && (counter_empty == 2)
					counter_pos += 1
					option1.push(combos)
				elsif (counter_taken_opp == 1) && (counter_empty == 2)
					counter_possibility += 1
					option.push(combos)
				end

			end
			
			# puts "counter_pos: #{counter_pos}"

			# p option1
			
			if (counter_possibility == 2) && (board.setup.count(" ") <= 6)

				same = option[0]&option[1]

				# puts "same: #{same}"
				# puts "option[0]: #{option[0]}"
				# puts "option[1]: #{option[1]}"

			
				if same == []

					corners = [0,2,6,8]

					@counter = corners.sample
					@turn = false
				else
					# puts "hello"
					@counter = same[0]
					# puts "counter: #{@counter}"
					@turn = false
					# puts "@turn: #{@turn}"

				end
				# puts "@counter: #{@counter}"


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


				if counter_pos >= 1
					option1.each do |combo|
						combo.each do |position|
							if board.setup[position] == " "
								if (board.setup[0] && board.setup[8]) || (board.setup[2] && board.setup[6]) == marker 
									sides = [1,3,5,7]

									sides.each do |x|
										if board.setup[x] == " "
												@counter = x
											@turn = false
										end
									end
								end
							end
						end
					
					end

				elsif (board.setup[shared_positions[0]] == " ")
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
			if board.setup[0] == marker && (board.setup[8] == " ")
				@counter = 8
				@turn = false
			elsif board.setup[2] == marker && (board.setup[8] == " ")
				@counter = 6
				@turn = false
			elsif board.setup[6] == marker && (board.setup[8] == " ")
				@counter = 2
				@turn = false
			elsif board.setup[8] == marker && (board.setup[8] == " ")
				@counter = 0
				@turn = false
			end
		end
	end

	def check_corner(board)
		if @turn == true
			if board.setup[0] == " "
				@counter = 0
				@turn = false
			elsif board.setup[2] == " "
				@counter = 2
				@turn = false
			elsif board.setup[6] == " "
				@counter = 6
				@turn = false
			elsif board.setup[8] == " "
				@counter = 8
				@turn = false
			end
		end
	end

	def check_side(board)
		if @turn == true
			if board.setup[1] == " "
				@counter = 1
				@turn = false
			elsif board.setup[3] == " "
				@counter = 3
				@turn = false
			elsif board.setup[5] == " "
				@counter = 5
				@turn = false
			elsif board.setup[7] == " "
				@counter = 7
				@turn = false
			end
		end
	end
end

		# board = Board.new
		# ai1 = Unbeatable_ai.new
		# ai1.turn = true
		# ai1.create = ["X", "X", "X", "X", "X"]
		# # board.setup = [" ", " ", " ", "X", "O", "X", " ", " ", " "]
		# board.setup = [" ", " ", "O", "O", "X", " ", "X", " ", " "]
		# ai1.pick_spot(board, "O")
		# #ai1.check_fork_enemy(board, "O")
		# board.print_board

