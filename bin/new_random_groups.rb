def new_random_groups(numgroup)
    studentname = IO.readlines('public/names.txt').map{ |element| element.chomp}.shuffle
	numgroup = 1 #How to doesn't put this value without an error?
	numstudent = studentname.length
	groups = (1..numgroup).zip(*studentname.each_slice(numgroup))
	groups.each do |index, *items|
    	items.compact! #remove nils
	end
	studentname.shuffle
end