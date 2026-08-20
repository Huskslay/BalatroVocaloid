
local function recurse_text_to_joker(table, conversions)
   for i, v in pairs(table) do
      if type(v) == "string" then
         for i2, v2 in pairs(conversions) do
            table[i] = table[i]:gsub(i2, v2)
         end
      elseif type(v) == "table" then
         recurse_text_to_joker(v, conversions)
      end
   end
end


if BV.MOD.config.change_text then

   for k, v in pairs(BV.Jokers.list) do
      if v.text then
         for k2, v2 in pairs(v.text) do
            G.localization.descriptions.Joker[k][k2] = v2
         end
      end
   end

   recurse_text_to_joker(
      G.localization, BV.Jokers.replace_text
   )
end
