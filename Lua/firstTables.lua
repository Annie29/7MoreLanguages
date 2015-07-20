stateFL = { 
	capital = 'Tallahassee',
	bird = 'mockingbird',
	population = 19890000
	}

stateFL.nickname = 'Sunshine State'
	
citiesFL = {
	'Gainesville',
	'Jacksonville',
	'Miami',
	'Tampa'
	}
	
citiesFL[5] = 'North Palm Beach'

 function print_table(t)
    for k, v in pairs(t) do
	   print (k .. ": " .. v)
	end
end
 
stateFL[1] = 'Gainesville'
stateFL[2] = 'Jacksonville'
stateFL[3] = 'Miami'
stateFL[4] = 'Tampa'
stateFL[53] = 'Newberry'


citiesGA = {}
citiesGA[1] = 'Macon'
citiesGA[4] = 'Savannah'
citiesGA['1'] = 'Atlanta'
citiesGA['01'] = 'Richmond Hill'
