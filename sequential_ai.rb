class Sequential
	attr_accessor :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X", "X"]
		@counter = 0
		@turn = false
	end

	def pick_spot(board)
		while (board.check_position?(@counter) == false) 
			@counter+= 1
		end

		if (@turn == true)
			board.set_position(@counter, @create.pop)
		end

		return board
	end
end