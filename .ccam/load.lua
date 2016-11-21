--[[ Load CCAM configuration file ]]--
_G["CCAM_CONF"] = {}

local conf = loadfile("/.ccam/config.cfg")
setfenv(conf, CCAM_CONF)
conf()

--[[ Load libraries ]]--
-- List libraries
local libraries = fs.list(CCAM_CONF.LIB_DIR)

-- Load libraries into table
for _, v in pairs(libraries) do
	_G[v] = {}
	local lib = loadfile(CCAM_CONF.LIB_DIR .. v .. CCAM_CONF.LIB_MAIN)
	setfenv(lib, setmetatable( _G[v], { __index = _G } ))
	lib()
end

--[[ Load repository table ]]--
local repo_file = fs.open(CCAM_CONF.LIB_DIR .. "libccam/repos.json", "r")
CCAM_CONF.REPOS = json.decode(repo_file.readAll())
repo_file.close()

if CCAM_CONF.CHECK_UPDATES_STARTUP then
	libccam.updateall(true)
end

--[[ Add bin directory to shell path ]]--
shell.setPath(shell.path() .. ":" .. CCAM_CONF.BIN_DIR)
