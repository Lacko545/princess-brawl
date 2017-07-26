local util = {}


-- map(function, table)
-- e.g: map(double, {1,2,3})    -> {2,4,6}
function util.map(func, tbl)
	local newtbl = {}
		for i,v in pairs(tbl) do
			newtbl[i] = func(v)
		end
	return newtbl
end

-- filter(function, table)
-- e.g: filter(is_even, {1,2,3,4}) -> {2,4}
function util.filter(func, tbl)
	local newtbl= {}
	for i,v in pairs(tbl) do
		if func(v) then
			newtbl[i]=v
		end
	end
	return newtbl
end


function util.callIfCallable(f)
    return function(...)
        error, result = pcall(f, ...)
        if error then -- f exists and is callable
            print('ok')
            return result
        end
        -- nothing to do, as though not called, or print('error', result)
    end
end

return util
