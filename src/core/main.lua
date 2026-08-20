
-----------------------------------------------------------
-- Globals --
-----------------------------------------------------------

-- Global table
BV = {
   MOD = SMODS.current_mod,
}
-- Not needed but I want to use these
BV.keys = {
   decks =  BV.MOD.prefix .. '_decks.',
   joker_atlases = BV.MOD.prefix .. '_joker_atlases.',
   joker_sounds = BV.MOD.prefix .. '_joker_sounds.'
}



-----------------------------------------------------------
-- Folder check --
-----------------------------------------------------------

local function get_parent_folder(path)
   path = path:gsub("\\", "/")
   if path:sub(-1) == "/" then
      path = path:sub(1, -2)
   end

   local last_slash = path:match("^.*()/")
   if not last_slash then
      return nil
   end

   local parent_path = path:sub(1, last_slash - 1)
   local parent_folder_start = parent_path:match("^.*()/")

   if not parent_folder_start then return parent_path end
   return parent_path:sub(parent_folder_start + 1)
end


if BV.MOD.config.direct_folder_required and get_parent_folder(SMODS.current_mod.path) ~= "Mods" then
   error("Please make sure the BalatroVocaloid mod folder is diretly in the Balatro `Mods` folder, or enable not direct in the mods config")
end



-----------------------------------------------------------
-- Load other --
-----------------------------------------------------------

local function load_lua(folder)
   local files = SMODS.NFS.getDirectoryItems(BV.MOD.path .. folder)
   for _, file in ipairs(files) do
      assert(SMODS.load_file(folder .. "/" .. file))()
   end
end

load_lua("src/info")
load_lua("src/main")
load_lua("src/ui")
