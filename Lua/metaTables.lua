--  A table to create a metatable for 
stateFL = { 
	capital = 'Tallahassee',
	bird = 'mockingbird',
	population = 19890000
	}
	
function to_string(t)
	local result = {}
	for k, v in pairs(t) do
		result[#result + 1] = k .. ": " .. v
	end
	return table.concat(result, "\n")
end

local _private = {}
function strict_read(table, key)

	
mt = {
   __tostring = to_string,
   __index = strict_read
}