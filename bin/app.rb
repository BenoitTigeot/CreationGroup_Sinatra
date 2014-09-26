require 'sinatra'
require './bin/new_random_groups'

set :static, true
set :public_folder, 'public'
set :views, "views"

get '/' do
	@result = new_random_groups(1)
	erb :hello_form
end

get '/numgroup/' do
	@result = new_random_groups(1)
    erb :index
end

post '/numgroup/' do
	numgroup = params[:numbergroup].to_i
	@result = new_random_groups(numgroup)
	erb :index, :locals => {'numbergroup' => numgroup}
end
