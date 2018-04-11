local ret = false;
local list = {};
local num = 5;

local host = KEYS[1]
local queue = ARGV[1]
local delay_set = ARGV[2]
while (num > 0)
do
	ret = redis.call("LPOP", queue);
	if ret == false
	then
		local length = redis.call("LLEN", queue);
		if length == 0
		then
			redis.call("SREM", delay_set, host)
		end
		return list
	end
	table.insert(list, ret);
	num = num - 1;
end;

return list
