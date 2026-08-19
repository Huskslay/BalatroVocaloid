
local atlas_path_joker = 'jokers.png'


if MOD.config.change_joker_atlas then
   SMODS.Atlas{
      key = 'Joker',
      px = 71,
      py = 95,
      path = atlas_path_joker,
      prefix_config = {key = false},
   }
end