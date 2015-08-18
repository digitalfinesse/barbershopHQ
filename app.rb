require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Clients < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3 }
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
end

class Barbers < ActiveRecord::Base

end

before do
	@barbers = Barbers.all
end

get '/' do
	@barbers = Barbers.order "created_at DESC"
	erb :index	
end

get '/visit' do
	@c = Clients.new
	erb :visit
end

post '/visit' do

	@c = Clients.new params[:clients]
	
	if @c.save
		erb "<h2>Вы записаны!</h2>"
	else
		@error = @c.errors.full_messages.first
		erb :visit
	end
end

get '/contacts' do
  	erb :contacts
end