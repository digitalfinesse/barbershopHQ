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
	@barbers = Barbers.all
	erb :index	
end