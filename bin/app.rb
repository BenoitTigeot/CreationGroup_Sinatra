require 'sinatra'
require './new_random_groups'

set :static, true
set :public_folder, 'public'
set :views, "views"

get '/' do
	@result = new_random_groups(1)
	erb :hello_form
end

post '/hello/' do
	numgroup = params[:numgroup].to_i
	@result = new_random_groups(numgroup)
	erb :index, :locals => {'numgroup' => numgroup}
end