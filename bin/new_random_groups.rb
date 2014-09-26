def new_random_groups(numgroup)
	studentname = IO.readlines('public/names.txt').map{ |element| element.chomp}.shuffle
	groups = (1..numgroup).zip(*studentname.each_slice(numgroup))
	if numgroup == 1
		groups.each do |index, *items|
	    	items.compact! #remove nils
	    	return "<ul><h2>Pas de groupe mais #{studentname.length} élèves:</h2><li>#{items.join("<br /><li>")}"
	    end
	else 
		groups.each do |index, *items|
    		items.compact! #remove nils
    		@groupsreturn = "<ul><h5>Groupe #{index+1} avec #{items.length} élèves:</h5><br /><li>#{items.join("<br /><li>")}"
   	end
   end
end