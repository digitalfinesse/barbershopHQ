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

get '/' do
	@barbers = Barbers.order "created_at DESC"
	erb :index	
end

get '/visit' do

	@username = params[:username]
	@phone    = params[:phone]
	@datetime = params[:datetime]
	@barberopt = params[:barberopt]
	@color = params[:color]	

	c = Clients.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barberopt
	c.color = @color

  	erb :visit
end

get '/contacts' do
  	erb :contacts
end