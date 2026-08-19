
-----------------------------------------------------------
-- Globals --
-----------------------------------------------------------

MOD = SMODS.current_mod


-----------------------------------------------------------
-- Load other src --
-----------------------------------------------------------


local src = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. "src")
for _, file in ipairs(src) do
   assert(SMODS.load_file("src/" .. file))()
end