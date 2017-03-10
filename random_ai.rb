class Random_ai
	attr_accessor :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X", "X"]
		@counter = rand(0..8)
		@turn = nil
	end

	def pick_spot(board)
		while board.check_position?(@counter) == false
			@counter = rand(0..8)
		end

		board.set_position(@counter, @create.pop)

		return board
	end
end