require 'sinatra'
require './bin/new_random_groups'

set :static, true
set :public_folder, 'public'
set :views, "views"


get '/' do
    @result = new_random_groups(1)
  	erb :hello_form
end

post '/hello/' do
    numgroup = params[:numgroup].to_i || 1
    @result = new_random_groups(@numgroup)
    @numgroup = numgroup  #Doesn't know how to it shorter
    erb :index, :locals => {'numgroup' => numgroup}
end