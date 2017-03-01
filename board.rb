class Board
	attr_reader :setup
	def initialize
		@setup = ["", "", "", "", "", "", "", "", ""]
	end

	def set_position(position, marker)
		@setup[position] = marker
	end
end