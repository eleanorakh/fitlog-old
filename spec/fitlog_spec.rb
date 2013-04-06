require 'fitlog'
require 'rubygems'
require 'rack/test'

describe 'fitlog' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'shows humans' do
    human = Human.new(:name => 'Draco', :weight => 67, :height => 5.11, :fitness_level => 4)
    human.save

    get "/human/#{human.id}"

    expect(last_response).to be_ok
    expect(last_response.body).to include "Name:\nDraco"
    expect(last_response.body).to include "Weight:\n67"
    expect(last_response.body).to include "Height:\n5.11"
    expect(last_response.body).to include "Fitness Level:\n4"
  end
end
