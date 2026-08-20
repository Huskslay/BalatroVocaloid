
-----------------------------------------------------------
-- Helpful functions --
-----------------------------------------------------------

-- Tests if a card is a joker card
---@param card Card
local function isJoker(card)
   return card.ability and card.ability.set == "Joker" and card.config and card.config.center_key
end



-----------------------------------------------------------
-- Atlases --
-----------------------------------------------------------

-- Overwrite jokers
if BV.MOD.config.change_joker_atlas then
   SMODS.Atlas{
      key = 'Joker',
      px = 71,
      py = 95,
      path = BV.Jokers.image_path,
      prefix_config = {key = false},
   }
end


-- GIF Jokers
for _, v in pairs(BV.Jokers.list) do
   if v.gif then
      v.gif.atlas = SMODS.Atlas{
         key = BV.keys.joker_atlases .. v.gif.atlas_name,
         px = 71,
         py = 95,
         path = v.gif.atlas_name,
         prefix_config = {key = false},
      }
   end
end


-- Register sounds
for _, v in pairs(BV.Jokers.list) do
   if v.sounds and v.sounds.show then
      SMODS.Sound{
         key = BV.keys.joker_sounds .. v.sounds.show.path,
         path = v.sounds.show.path
      }
   end
end



-----------------------------------------------------------
-- GIF Jokers --
-----------------------------------------------------------

-- Set GIF image function
local function setGIF(card, gif)
   if not gif then return end

   local timer = G.TIMERS.REAL * gif.speed
   local index = (math.floor(timer) - 1) % gif.size.total

   card.children.center.atlas = gif.atlas
   local x = index % gif.size.columns
   local y = math.floor(index / gif.size.columns)

   card.children.center:set_sprite_pos({
      x = x,
      y = y
   })
end


-- Card update patch
---@param card Card
BV.Jokers.update = function(card)
   if BV.MOD.config.gif_jokers and isJoker(card) then
      for k, v in pairs(BV.Jokers.list) do
         if card.config.center_key == k then
            setGIF(card, v.gif)
            break
         end
      end
   end
end



-----------------------------------------------------------
-- Joker show sounds --
-----------------------------------------------------------

-- Play sound function
local function playShowSound(sounds)
   if not sounds or not sounds.show then return end

   local pitch = sounds.show.pitch or 1
   local volume = sounds.show.volume or 0.75

   play_sound(BV.keys.joker_sounds .. sounds.show.path, pitch, volume)
end


-- Card init patch
---@param card Card
BV.Jokers.init = function(card)
   if BV.MOD.config.joker_sounds and isJoker(card) then
      for k, v in pairs(BV.Jokers.list) do
         if card.config.center_key == k then
            playShowSound(v.sounds)
            break
         end
      end
   end
end
