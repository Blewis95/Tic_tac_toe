require 'sinatra'
require_relative "unbeatable_ai.rb"
require_relative "board.rb"
require_relative "game.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
require_relative "player.rb"
require_relative "Console.rb"

enable :sessions

get '/' do
	erb :menu
end

post '/p1move' do
	

	if params[:player1] == "player"
		session[:pl1] = Player.new
	elsif params[:player1] == "easy"
		session[:pl1] = Sequential.new
	elsif params[:player1] == "medium"
		session[:pl1] = Random_ai.new
	elsif params[:player1] == "hard"
		session[:pl1] = Unbeatable_ai.new
	end

	if params[:player2] == "player"
		session[:pl2] = Player.new
	elsif params[:player2] == "easy"
		session[:pl2] = Sequential.new
	elsif params[:player2] == "medium"
		session[:pl2] = Random_ai.new
	elsif params[:player2] == "hard"
		session[:pl2] = Unbeatable_ai.new
	end

	session[:pl1].turn == true
	game = Game.new
	game.change_markers(session[:pl2])
	session[:game] = game
	session[:board] = Board.new
	redirect '/board'

	
end

get '/board' do
	if session[:pl1].turn == true
		if session[:pl1].class == "player"
			session[:board].set_position(params[:choice].to_i,"X")
		elsif session[:pl1].class == "Unbeatable_ai"
			session[:pl1].pick_spot(session[:board],"O")
		else
			session[:pl1].pick_spot(session[:board])
		end
	elsif session[:pl2].turn == true
		if session[:pl2].class == player
			session[:board].set_position(params[:choice].to_i,"X")
		elsif session[:pl2].class == Unbeatable_ai
			session[:pl2].pick_spot(session[:board],"O")
		else
			session[:pl2].pick_spot(session[:board])
		end
	end
	erb :board, :locals => {:board => session[:board]}
end

post "/move" do

	if session[:pl1].turn == true
		session[:pl1].turn = false
		session[:pl2].turn = true
	elsif session[:pl2].turn == true
		session[:pl2].turn = false
		session[:pl1].turn = true
	end

	redirect '/board'
	

	
end

# post "p2move" do


# end