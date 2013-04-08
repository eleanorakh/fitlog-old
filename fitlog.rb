require 'rubygems'
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/dev.db")

require 'human'

DataMapper.finalize.auto_upgrade!

get '/new' do
  erb :new
end

post '/create' do
  human = Human.new(params)
  human.save
  redirect "/human/#{human.id}"
end

get '/human/:id' do
  @human = Human.get(params[:id])
  erb :show
end

get '/' do
  erb :index
end
