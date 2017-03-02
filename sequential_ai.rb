class Sequential
	attr_reader :create, :counter
	def initialize
		@create = ["X", "X", "X", "X"]
		@counter = 0
	end

	def pick_spot(board)
		if board.check_position?(@counter)
			board.set_position(@counter, @create.pop)
			@counter+= 1
		else
			@counter+=1
			board.set_position(@counter, @create.pop)
			@counter+= 1
		end

		board.setup
	end
end