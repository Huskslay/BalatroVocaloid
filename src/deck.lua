
local mod_description = 'Vocaloid Deck' -- English-language description, also used as default
local mod_atlas_key = 'vocaloidCards_atlas' -- Format: PREFIX_KEY
local deck_suits = {"hearts", "clubs", "diamonds", "spades"} -- Which suits to replace
local deck_ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"} -- Which ranks to replace
local deck_display_ranks = {"Jack", "Queen", "King"} -- Which ranks are show on the selection screen

local deck_atlas_path_lc = 'vocaloid_lc.png' -- Filename for the image in the asset folder
local deck_suit_colors_lc = {HEX('F03464'), HEX('235955'), HEX('F06B3F'), HEX('3C4368')} -- Replacement colours for the suits
local deck_atlas_path_hc = 'vocaloid_hc.png' -- Filename for the high-contrast version of the texture, if existing
local deck_suit_colors_hc = {HEX('E32B1F'), HEX('008DE4'), HEX('E39100'), HEX('27863B')} -- Replacement colours for the suits


-----------------------------------------------------------
-- Atlases --
-----------------------------------------------------------


-- Low-contrast palette
SMODS.Atlas{
   key = mod_atlas_key .. '_lc',
   px = 71,
   py = 95,
   path = deck_atlas_path_lc,
   prefix_config = {key = false},
}

-- High-contrast palette
SMODS.Atlas{
   key = mod_atlas_key .. '_hc',
   px = 71,
   py = 95,
   path = deck_atlas_path_hc,
   prefix_config = {key = false},
}


-----------------------------------------------------------
-- Set decks --
-----------------------------------------------------------


for i, suit in ipairs(deck_suits) do
   local palettes = {}

   -- Low-contrast palette
   local palette_lc = {
      key = "lc",
      ranks = deck_ranks,
      display_ranks = deck_display_ranks,
      atlas = mod_atlas_key .. '_lc',
      pos_style = "deck",
      colour = deck_suit_colors_lc[i],
   }
   if BV.MOD.config.change_text_colours then
      palette_lc.colour = deck_suit_colors_lc[i]
   end
   table.insert(palettes, palette_lc)

   -- High-contrast palette
   local palette_hc = {
      key = "hc",
      ranks = deck_ranks,
      display_ranks = deck_display_ranks,
      atlas = mod_atlas_key .. '_hc',
      pos_style = "deck",
   }
   if BV.MOD.config.change_text_colours then
      palette_hc.colour = deck_suit_colors_hc[i]
   end
   table.insert(palettes, palette_hc)

   -- Add
   SMODS.DeckSkin{
      key = string.lower(suit) .. '_skin',
      suit = suit:gsub("^%l", string.upper),
      loc_txt = mod_description,
      palettes = palettes
   }
end