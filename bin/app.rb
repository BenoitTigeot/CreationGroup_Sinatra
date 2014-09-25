require 'sinatra'

set :static, true
set :public_folder, 'public'
set :views, "views"

def new_random_groups(numgroup)
	studentname = IO.readlines('public/names.txt').shuffle
	# studentname = IO.readlines('public/names.txt').map{ |element| element.chomp}.shuffle
	groups = (1..numgroup).zip(*studentname.each_slice(numgroup))
	if numgroup == 1
		groups.each do |*items|
	    	items.compact! #remove nils
	    	return "<ul><h2>Pas de groupe mais #{studentname.length} élèves:</h2>#{items.join("<br /><li>")}"
	    end
	else 
		groups.each do |index, *items|
    		items.compact! #remove nils
    		return "#{items.join("<br />")}"
    		# return "<ul><h5>Groupe #{index+1} avec #{items.length} élèves:</h5><br /><li>#{items.join("<br /><li>")}"
   	end
   end
end


get '/' do
	@result = new_random_groups(1)
	erb :hello_form
end

post '/hello/' do
	numgroup = params[:numgroup].to_i
	@result = new_random_groups(numgroup)
	erb :index, :locals => {'numgroup' => numgroup}
end