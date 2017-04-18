require 'sinatra'
require_relative "unbeatable_ai.rb"
require_relative "board.rb"
require_relative "game.rb"
require_relative "random_ai.rb"
require_relative "sequential_ai.rb"
enable :sessions

get '/' do
	erb :menu
end

post '/game' do

	session[:pl1] = params[:player1]
	session[:pl2] = params[:player2]

	erb :board, :locals => {:pl1 => session[:pl1], :pl2 => session[:pl2]}
end

