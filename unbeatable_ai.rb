class Unbeatable_ai
	attr_accessor :create, :counter
	def initialize
		@create = ["X", "X", "X", "X"]
		@counter = 0
	end

	def pick_spot(board)

		check_win?(board)

		if board.check_position?(@counter) == true
			board.set_position(@counter, @create.pop)
		end

		board.setup

	end

	def check_win?(board)
		winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
		counter = 0


		winning.each do |option|
			option.each do |spot|
				if board.setup[spot] == "X"
					counter += 1
				end
			end

			if counter == 2
				option.each do |spot|
					if (board.setup[spot] == "")
						@counter = spot
					end
				end
			end
		end
	end
end