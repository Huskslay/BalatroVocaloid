
for k, v in pairs(BV.Atlases) do
   SMODS.Atlas{
      key = k,
      px = v.px,
      py = v.py,
      path = v.path,
      prefix_config = v.prefix_config or {key = true},
   }
end
