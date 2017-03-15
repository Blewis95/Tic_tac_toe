class Player
	attr_accessor :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X", "X"]
		@counter = nil
		@turn = false
	end

	def pick_spot(board)
		begin
			puts "Please choose a spot between 0 and 8"
			@counter = gets.chomp

			while board.check_position?(@counter.to_i) == false
				puts "Position is full! please try again:"
				@counter = gets.chomp
			end 

		end while ((@counter.to_i != 0) && (@counter.to_i != 1) && (@counter.to_i != 2) && (@counter.to_i != 3) && (@counter.to_i != 4) && (@counter.to_i != 5) && (@counter.to_i != 6) && (@counter.to_i != 7) && (@counter.to_i != 8))

		if @turn == true
			board.set_position(@counter.to_i, @create.pop)
		end

		return board
	end

end