require 'sinatra'

set :static, true
set :public_folder, 'public'
set :views, "views"

def new_random_groups(numgroup)
    studentname = IO.readlines('public/names.txt').map{ |element| element.chomp}.shuffle
	numgroup = 1 #Comment ne pas mettre cette valeur?
	numstudent = studentname.length
	groups = (1..numgroup).zip(*studentname.each_slice(numgroup))
	groups.each do |index, *items|
    	items.compact! #remove nils
    	#puts "Group #{index+1} with #{items.length} students: \n - #{items.join("\n - ")}"
	end
	studentname.shuffle
end


get '/' do
    @result = new_random_groups(1)
  	erb :hello_form
end

post '/hello/' do
    numgroup = params[:numgroup].to_i || 1
    @result = new_random_groups(@numgroup)
    @numgroup = numgroup
    erb :index, :locals => {'numgroup' => numgroup}
end