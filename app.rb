require 'sinatra'
require_relative 'board.rb'
enable :sessions

get '/' do
	erb :menu
end

