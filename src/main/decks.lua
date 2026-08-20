
for k, v in pairs(BV.Decks) do

   local key = BV.keys.decks .. k

   -----------------------------------------------------------
   -- Register hight and low contracst atlases --
   -----------------------------------------------------------

   -- Low-contrast palette
   if v.lc then
      SMODS.Atlas{
         key = key .. '_lc',
         px = 71,
         py = 95,
         path = v.lc.path,
         prefix_config = {key = false},
      }
   end

   -- High-contrast palette
   if v.hc then
      SMODS.Atlas{
         key = key .. '_hc',
         px = 71,
         py = 95,
         path = v.hc.path,
         prefix_config = {key = false},
      }
   end


   -----------------------------------------------------------
   -- Set decks --
   -----------------------------------------------------------

   for i, suit in ipairs(v.change_suits) do
      local palettes = {}

      if v.lc then
         -- Low-contrast palette
         local palette_lc = {
            key = "lc",
            ranks = v.change_ranks,
            display_ranks = v.display_ranks,
            atlas = key .. '_lc',
            pos_style = "deck",
         }
         if BV.MOD.config.change_text_colours and v.lc.colours then
            palette_lc.colour = HEX(v.lc.colours[i])
         end
         table.insert(palettes, palette_lc)
      end

      if v.hc then
         -- High-contrast palette
         local palette_hc = {
            key = "hc",
            ranks = v.change_ranks,
            display_ranks = v.display_ranks,
            atlas = key .. '_hc',
            pos_style = "deck",
         }
         if BV.MOD.config.change_text_colours and v.hc.colours then
            palette_hc.colour = HEX(v.hc.colours[i])
         end
         table.insert(palettes, palette_hc)
      end

      -- Add
      SMODS.DeckSkin{
         key = k .. "_" .. string.lower(suit) .. '_skin',
         suit = suit:gsub("^%l", string.upper),
         loc_txt = v.name,
         palettes = palettes
      }
   end

end
