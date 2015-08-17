require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Barbers < ActiveRecord::Base

end

class Clients < ActiveRecord::Base

end

before do
	@barbers = Barbers.all
end

get '/' do
	@barbers = Barbers.order "created_at DESC"
	erb :index	
end

get '/visit' do

	erb :visit
end

post '/visit' do

	c = Clients.new params[:clients]
	c.save

  	erb "<h2>Вы записаны!</h2>"
end

get '/contacts' do
  	erb :contacts
end