class Player
	attr_accessor :create, :counter, :turn
	def initialize
		@create = ["X", "X", "X", "X", "X"]
		@counter = 0
		@turn = false
	end
end