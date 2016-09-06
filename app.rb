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
before do
  @questions = Question.all
  @logins = Login.all
end
post '/admin/:model' do
  klass = Object.const_get(params[:model].capitalize)
  @form = params[params[:model]]
  klass.create(@form.delete("new"))
  @form.each do |key, value|
    id = key.scan(/\d+/)[0]
    klass.find(id).update(value)
  end
  erb :admin
end
post '/admin' do
  if Login.attempt(params[:username], params[:password]) || Login.count == 0
    @questions = Question.all
    @logins = Login.all
    erb :admin
  else
    erb :login
  end
end

