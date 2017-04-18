require 'sinatra'
require_relative 'board.rb'
enable :sessions

get '/' do
	erb :menu
end

post '/game' do

	session[:pl1] = params[:player1]
	session[:pl2] = params[:player2]

	erb :board, :locals => {:pl1 => session[:pl1], :pl2 => session[:pl2]}
end

