require 'sinatra'

set :static, true
set :public_folder, 'public'
set :views, "views"

def new_random_groups

    studentname = ["Damien", "Rafik", "Benoit", "Anne-Marie", "Faz", "Son", "Stephane", "Mylene", "Abdrahmane", "Nolan", "Man", "Houda", "Mouna", "Guillaume", "Fanta", "Myriam", "Genevieve", "Semia", "Djibril", "Alexandra", "Guibril", "Mehdi", "Aurelie" ]
	   
	numgroup = 4# We add to_i otherwise we get a string
	numstudent = studentname.length
	studentname.each_slice(numgroup).with_index do |items,index|
    	puts "Group #{index+1} with #{items.length} students: \n - #{items.join("\n - ")}"
	end
	studentname.shuffle
end


get '/' do
    #redirect '/index.html'
    @result = new_random_groups
  	erb :hello_form
end

post '/hello/' do
    numgroup = params[:numgroup].to_i || 1
    erb :index, :locals => {'numgroup' => numgroup}
end