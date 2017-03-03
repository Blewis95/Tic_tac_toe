class Board
	attr_accessor :setup
	def initialize
		@setup = ["", "", "", "", "", "", "", "", ""]
	end

	def set_position(position, marker)
		@setup[position] = marker
	end

	def check_position?(position)
		if @setup[position] == ""
			true
		else
			false
		end
	end

	def check_full?()
		@setup.count("") == 0
	end

	def check_win?
		markers = ["X", "O"]

		winning = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

		winner = false

		markers.each do |mark|
			winning.each do |combos|
				matches = 0
				combos.each do |spot|
					if @setup[spot] == mark
						matches += 1
					end
				end
				if matches == 3
					winner = true
				end
			end
		end

		return winner
	end
end