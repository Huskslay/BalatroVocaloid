
-----------------------------------------------------------
-- Atlases --
-----------------------------------------------------------

if BV.MOD.config.change_joker_atlas then
   SMODS.Atlas{
      key = 'Joker',
      px = 71,
      py = 95,
      path = BV.Jokers.image_path,
      prefix_config = {key = false},
   }
   for _, v in pairs(BV.Jokers.list) do
      if v.gif then
         v.gif.atlas = SMODS.Atlas{
            key = 'bv.jokers.' .. v.gif.atlas_name,
            px = 71,
            py = 95,
            path = v.gif.atlas_name,
            prefix_config = {key = false},
         }
      end
   end
end


-----------------------------------------------------------
-- Patches --
-----------------------------------------------------------

local function setGIF(card, info)
   if not info then return end

   local timer = G.TIMERS.REAL * info.speed
   local index = (math.floor(timer) - 1) % info.size.total

   card.children.center.atlas = info.atlas
   local x = index % info.size.columns
   local y = math.floor(index / info.size.columns)

   card.children.center:set_sprite_pos({
      x = x,
      y = y
   })
end

---@param card Card
BV.Jokers.update = function(card)
   if BV.MOD.config.gif_jokers then
      if card.ability and card.ability.set == "Joker" then
         if card.config and card.config.center_key then
            for k, v in pairs(BV.Jokers.list) do
               if card.config.center_key == k then
                  setGIF(card, v.gif)
                  break
               end
            end
         end
      end
   end
end
