local commit
pcall(function()
	commit = readfile('heatv4/profiles/commit.txt')
end)

local function wipe(path)
	if isfolder(path) then
		for _, item in listfiles(path) do
			wipe(item)
		end
		pcall(delfolder, path)
	elseif isfile(path) then
		pcall(delfile, path)
	end
end

if isfolder('heatv4') then
	wipe('heatv4')
end

pcall(function()
	game:GetService('StarterGui'):SetCore('SendNotification', {
		Title = 'heatv4',
		Text = 'deleted heatv4, reinjecting now',
		Duration = 4
	})
end)

task.wait(0.67)

loadstring(game:HttpGet('https://raw.githubusercontent.com/morningsale/heatv4/'..(commit or 'main')..'/main.lua', true))()
