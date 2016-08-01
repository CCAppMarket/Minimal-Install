--[[ CCAM App ]]--
local args = { ... }

local usage = "Usage: ccam <option> [application]"
        .. "\nAvaliable options:"
        .. "\n install to install an app"
        .. "\n update to update an app"
        .. "\n remove to remove an app"

if #args < 2 then
	print(usage)
else
	local option = args[1]
    local app_name = args[2]
    

	if option == "install" then
		ccam.downloadApp(app_name)
        
	elseif option == "update" then
		ccam.updateApp(app_name)
        
	elseif option == "remove" then
		ccam.deleteApp(app_name)
        
	else
		print(usage)
	end
end