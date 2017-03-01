class Board
	attr_reader :setup
	def initialize
		@setup = ["", "", "", "", "", "", "", "", ""]
	end

	def set_position(position, marker)
		@board[position] = marker
	end
end