require 'sinatra'

set :bind, '0.0.0.0'
get '/' do
  'TODO: generate survey'
end
post '/' do
  'TODO: email survey, thank user'
end
get '/admin' do
  'TODO: generate admin login'
end
post '/admin' do
  'TODO: check admin login, display admin form'
end
put '/admin' do
  'TODO: update admin settings'
end

