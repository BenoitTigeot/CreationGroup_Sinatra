require 'sinatra'

set :static, true
set :public_folder, 'public'
set :views, "views"

get '/' do
    redirect '/index.html'
end

get '/hello/' do
    erb :hello_form
end

post '/hello/' do
    greeting = params[:greeting] || "Hi There"
    name = params[:name] || "Nobody"

    erb :index, :locals => {'greeting' => greeting, 'name' => name}
end