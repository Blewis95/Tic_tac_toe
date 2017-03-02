class Sequential
	attr_reader :create, :counter
	def initialize
		@create = ["X", "X", "X", "X"]
		@counter = 0
	end

	def pick_spot(board)
		@create.pop
		@create
	end
end