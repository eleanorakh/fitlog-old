require 'rubygems'
require 'sinatra'
require 'human'

get '/name/:name' do
  human = Human.new(params[:name], 1, 1, 1)
  "Name: #{human.name}"
end
