
-----------------------------------------------------------
-- Config --
-----------------------------------------------------------


local config_path = SMODS.current_mod.path .. "config.lua"


CFG = {
   ChangeText = true,
   ChangeJokerAtlas = true,
   ChangeIcons = true,
   ChangeTextColours = true
}

if SMODS.NFS.getInfo(config_path) ~= nil then
   local configFile, err = SMODS.NFS.read(config_path)
   if not configFile then
      error("Could not read config file: " .. (err or "Unknown error"))
   end
   CFG = STR_UNPACK(configFile) or CFG
else
   warn("No config file, using defaults")
end


-----------------------------------------------------------
-- Load other src --
-----------------------------------------------------------


local src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src")
for _, file in ipairs(src) do
   assert(SMODS.load_file("src/" .. file))()
end
