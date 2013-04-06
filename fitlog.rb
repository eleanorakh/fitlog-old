require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/dev.db")

require 'human'

DataMapper.finalize.auto_upgrade!

get '/name/:name' do
  human = Human.new(params[:name], 1, 1, 1)
  human.save
  "Name: #{human.name}"
end

get '/human/:id' do
  @human = Human.get(params[:id])
  erb :show
end
