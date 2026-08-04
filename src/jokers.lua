
local atlas_path_joker = 'jokers.png'


if CFG.ChangeJokerAtlas then
   SMODS.Atlas{
      key = 'Joker',
      px = 71,
      py = 95,
      path = atlas_path_joker,
      prefix_config = {key = false},
   }
end