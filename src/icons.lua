
-----------------------------------------------------------
-- Mod Icon --
-----------------------------------------------------------


local mod_icon = 'modicon.png'


SMODS.Atlas {
   key = 'modicon',
   px = 32,
   py = 32,
   path = mod_icon
}


-----------------------------------------------------------
-- Game Icons --
-----------------------------------------------------------


local atlas_path_icons_lc = 'ui_assets_lc.png'
local atlas_path_icons_hc = 'ui_assets_hc.png'


if CFG.change_icons then
   SMODS.Atlas{
      key = 'ui_1',
      px = 18,
      py = 18,
      path = atlas_path_icons_lc,
      prefix_config = {key = false},
   }
   SMODS.Atlas{
      key = 'ui_2',
      px = 18,
      py = 18,
      path = atlas_path_icons_hc,
      prefix_config = {key = false},
   }
end
