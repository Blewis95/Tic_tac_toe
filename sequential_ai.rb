class Sequential
	attr_reader :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X", "X"]
		@counter = 0
		@turn = nil
	end

	def pick_spot(board)
		while board.check_position?(@counter) == false
			@counter+= 1
		end
		board.set_position(@counter, @create.pop)

		board.setup
	end
end