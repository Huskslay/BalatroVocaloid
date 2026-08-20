
-----------------------------------------------------------
-- Globals --
-----------------------------------------------------------

BV = {
   MOD = SMODS.current_mod
}


-----------------------------------------------------------
-- Load other --
-----------------------------------------------------------

local function load_lua(folder)
   local files = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. folder)
   for _, file in ipairs(files) do
      assert(SMODS.load_file(folder .. "/" .. file))()
   end
end

load_lua("src/info")
load_lua("src/main")
load_lua("src/ui")
