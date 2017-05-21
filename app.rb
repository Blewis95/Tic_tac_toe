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

	# session[:pl1].create = Array.new(8, "X")
	# session[:pl2].create = Array.new(8, "O")
	session[:pl1].turn = true
	session[:game] = Game.new
	session[:game].change_markers(session[:pl2])
	session[:board] = Board.new
	session[:turns] = 0
	redirect '/board'

	
end

get '/board' do	

	if session[:pl1].turn == true
		if session[:pl1].class == Player && session[:turns] != 0
			session[:pl1].pick_spot(session[:board], session[:choice])
			session[:pl2].turn = true
			session[:pl1].turn = false
			# session[:board].set_position(params[:choice].to_i,"X")
		elsif session[:pl1].class == Unbeatable_ai && session[:turns] != 0
			session[:pl1].pick_spot(session[:board],"O")
			session[:pl2].turn = true
			session[:pl1].turn = false
		elsif session[:turns] != 0
			session[:pl1].pick_spot(session[:board])
			session[:pl2].turn = true
			session[:pl1].turn = false
		end
	elsif session[:pl2].turn == true
		if session[:pl2].class == Player
			session[:pl2].pick_spot(session[:board], session[:choice])
			session[:pl1].turn = true
			session[:pl2].turn = false
			# session[:board].set_position(params[:choice].to_i,"O")
		elsif session[:pl2].class == Unbeatable_ai
			session[:pl2].pick_spot(session[:board],"X")
			session[:pl1].turn = true
			session[:pl2].turn = false
		elsif
			session[:pl2].pick_spot(session[:board])
			session[:pl1].turn = true
			session[:pl2].turn = false
		end
	end
	erb :board, :locals => {:board => session[:board]}
end

post "/move" do


	session[:choice] = ((params[:choice].to_i) - 1)
	session[:turns] += 1

	

	if session[:board].check_win? == true
		session[:finish] = "Winner!"
		redirect '/gameover'
	elsif session[:board].check_win? == false && session[:board].check_full? == true
		session[:finish] = "Tie!"
		redirect '/gameover'
	end

	if session[:board].check_position?(session[:choice]) == false
		if (session[:pl1].class == Player && session[:pl1].turn == true) || (session[:pl2].class == Player && session[:pl2].turn == true)
			redirect '/tryagain'
		end
	end


	redirect '/board'
	
	
end

get '/gameover' do
	erb :gameover
end

get '/tryagain' do 
	erb :tryagain
end

post '/tryagain' do
	erb :board, :locals => {:board => session[:board]}
end

post '/playagain' do
	erb :menu
end