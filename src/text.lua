
function Recurse_text_to_joker(table, conversions)
   for i, v in pairs(table) do
      if type(v) == "string" then
         for i2, v2 in pairs(conversions) do
            table[i] = table[i]:gsub(i2, v2)
         end
      elseif type(v) == "table" then
         Recurse_text_to_joker(v, conversions)
      end
   end
end

if CFG.ChangeText then
   G.localization.descriptions.Joker.j_hanging_chad.name = "Hanging"
   Recurse_text_to_joker(
      G.localization,
      {
         joker="miku",
         Joker="Miku",
         JOKER="MIKU"
      }
   )
end