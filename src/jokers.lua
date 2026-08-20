
-----------------------------------------------------------
-- Variables --
-----------------------------------------------------------

local atlas_path_joker = 'jokers.png'
local atlas_path_truck = 'truck.png'

BV.Jokers = {
   update = function(card) end
}
BV.Jokers.ReservedParkingInfo = {
   size = {
      total = 255,
      columns = 17
   },
   speed = 8,
   atlas = {}
}


-----------------------------------------------------------
-- Atlases --
-----------------------------------------------------------

if BV.MOD.config.change_joker_atlas then
   SMODS.Atlas{
      key = 'Joker',
      px = 71,
      py = 95,
      path = atlas_path_joker,
      prefix_config = {key = false},
   }
   BV.Jokers.ReservedParkingInfo.atlas = SMODS.Atlas{
      key = 'huskslay.truck',
      px = 71,
      py = 95,
      path = atlas_path_truck,
      prefix_config = {key = false},
   }
end


-----------------------------------------------------------
-- Patches --
-----------------------------------------------------------

local function setGIF(card, info)
   local timer = G.TIMERS.REAL * info.speed
   local index = (math.floor(timer) - 1) % info.size.total

   card.children.center.atlas = info.atlas
   local x = (index % info.size.columns)
   local y = math.floor(index / info.size.columns)

   card.children.center:set_sprite_pos(
      {
         x = x,
         y = y
      }
   )
end

---@param card Card
BV.Jokers.update = function(card)
   if BV.MOD.config.gif_jokers then
      if card.ability and card.ability.set == "Joker" then
         if card.ability.name == "Reserved Parking" then
            setGIF(card, BV.Jokers.ReservedParkingInfo)
         end
      end
   end
end