require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/all'

set :bind, '0.0.0.0'
get '/' do
  @questions = Question.all
  erb :index
end
post '/' do
  'TODO: email survey, thank user'
end
get '/login' do
  erb :login
end
get '/admin' do
  erb :login
end
post '/admin' do
  'TODO: update admin settings'
end
post '/login' do
  if Login.attempt(params[:username], params[:password]) || Login.count == 0
    @questions = Question.all
    erb :admin
  else
    erb :login
  end
end

