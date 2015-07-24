--[[
   An example of how to create sets from tables in Lua,
   taken from http://www.lua.org/pil/13.1.html ]]

Set = {}
    
    
function Set.union (a,b)
	local res = Set.new{}
	for k in pairs(a) do res[k] = true end
	for k in pairs(b) do res[k] = true end
	return res
end

function Set.intersection (a,b)
	local res = Set.new{}
	for k in pairs(a) do
		res[k] = b[k]
	end
	return res
end

function Set.tostring (set)
	local s = "{"
	local sep = ""
	for e in pairs(set) do
		s = s .. sep .. e
		sep = ", "
	end
	return s .. "}"
end
    
function Set.print (s)
	print(Set.tostring(s))
end

Set.mt = {}    -- metatable for sets

function Set.new (t)   -- 2nd version
	local set = {}      --  This needs to be a variable you won't use elsewhere in the table
	                    --  But there are ways around that too!
	setmetatable(set, Set.mt)
	for _, l in ipairs(t) do set[l] = true end
	return set
end

--  Demonstrate the previous functions
s1 = Set.new{10, 20, 30, 50}
s2 = Set.new{30, 1}
print(getmetatable(s1))          --> table: 00672B60 or something like that!
print(getmetatable(s2))          --> table: the same something as above

--  Add these to the metatable for the Set table
Set.mt.__add = Set.union  -- operator +
Set.mt.__mul = Set.intersection   -- operator *
Set.mt.__tostring = Set.tostring  -- for use in print
    
--  You can do this in one step
--  Lua only allows three relational metamethods
--  since the others can all come from these using  
--  the boolean not or changing the order of parameters
Set.mt.__le = function (a,b)    -- set containment
	for k in pairs(a) do
		if not b[k] then return false end
	end
	return true
end

Set.mt.__lt = function (a,b)
	return a <= b and not (b <= a)
end

Set.mt.__eq = function (a,b)
	return a <= b and b <= a
end

