--[[
  So, what about closure?  Can I build functions that "remember" the 
  values that were global when the function was built?
  ]]

--Simple function to multiply
function multiply (a, b)
   return a * b
end

--Let's build a function to multiply by a specific value
function make_multiplier(factor)
	f = function (val)
        return multiply (val, factor)
	end
	return f
end

--  Or even more simply:
function build_multiplier(factor)
	f = function (val)
		return val * factor
	end
	return f
end

--  Build two functions and call them
times_3 = build_multiplier (3)
times_8 = build_multiplier (8)

print ("4 times 3 is "..times_3(4))
print ("4 times 8 is "..times_8(4))


--  Build two functions and call them
times_2 = make_multiplier (2)
times_17 = make_multiplier (17)

print ("4 times 2 is "..times_2(4))
print ("4 times 17 is "..times_17(4))

-- Yay!  Works as expected!

--[[
   Some other things:
     First, let's return multiple values
]]

--[[  
  Returns the roots of the quadratic 
  equation a x^2 + b x + c = 0 
  ]]
function get_roots (a, b, c)
	if b^2 - 4 * a * c < 0 then
		return
	elseif b^2 - 4 * a * c > 0 then
		local root1 = (-b + math.sqrt(b^2 - 4 * a * c)) / (2 * a)
		local root2 = (-b - math.sqrt(b^2 - 4 * a * c)) / (2 * a)
		return root1, root2
	else
		return (-b + math.sqrt(b^2 - 4 * a * c)) / (2 * a)
	end
end

--[[
   Now, let's be sure that variables in functions are really global by default
   ]]
   
function set_some_stuff ()
	hidden = 42
end
