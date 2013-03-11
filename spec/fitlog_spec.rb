require 'fitlog'
require 'rubygems'
require 'rack/test'

describe 'fitlog' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'returns a name' do
    get '/name/draco'
    expect(last_response).to be_ok
    expect(last_response.body).to eq 'Name: draco'
  end
end
