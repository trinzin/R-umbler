require 'sinatra'
require "sinatra/reloader"


# Run this script with `bundle exec ruby app.rb`
require 'sqlite3'
require 'active_record'

#require model classes
# require './models/cake.rb'

# Use `binding.pry` anywhere in this script for easy debugging
require 'pry'
require 'csv'

# Connect to a sqlite3 database
# If you feel like you need to reset it, simply delete the file sqlite makes
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db'
)

register Sinatra::Reloader
enable :sessions

get '/' do

  erb :index
end

get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :index
  else
    erb :not_allowed
  end
end


get '/login' do
  erb :login
end

post '/users/login' do
  user = User.find_by(email: params["email"], password: params["password"])
  puts ">>>>>>>>>>>>"
  puts user.inspect
  puts ">>>>>>>>>>>>"
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/signup' do
  erb :signup
end

post '/users/signup' do
  temp_user = User.find_by(email: params["email"])
  if temp_user
    redirect '/login'
  else
    user = User.create(email: params["email"], password: params["password"])
    session[:user_id] = user.id
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end


