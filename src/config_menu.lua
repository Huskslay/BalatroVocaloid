-----------------------------------------------------------
-- Create warning and line in a table for buttons --
-----------------------------------------------------------

local longest = 1
for key, _ in pairs(BV.MOD.config) do
   if #key > longest then
      longest = #key
   end
end

local config_nodes = {
   {
      n = G.UIT.R,
      config = { align = "cm", padding = 0.05, color = G.C.UI.OUTLINE_DARK },
      nodes = {
         {
            n = G.UIT.T,
            config = { text = "*A restart is required to take effect*", align = "tm", padding = 0.05, scale = 0.25 }
         }
      }
   },
   {
      n = G.UIT.R,
      config = { align = "cm", padding = 0.1 },
      nodes = {
         {
            n = G.UIT.T,
            config = { text = string.rep("-", longest + 7), align = "tm", padding = 0.5, scale = 0.5, color = G.C.UI.OUTLINE_DARK }
         }
      }
   }
}


-----------------------------------------------------------
-- On button click --
-----------------------------------------------------------

G.FUNCS.balatrovocaloid_toggle_config_button = function(e)
   local key = e.config.data_key
   if key and BV.MOD.config[key] ~= nil then
      BV.MOD.config[key] = not BV.MOD.config[key]
      e.config.text_node.config.text = key .. ": " .. tostring(BV.MOD.config[key])
      local _, _ = pcall(SMODS.save_mod_config, BV.MOD)
      e.UIBox:recalculate()
   end
end


-----------------------------------------------------------
-- Create buttons --
-----------------------------------------------------------

for key, value in pairs(BV.MOD.config) do
   local text_node = {
      n = G.UIT.T,
      config = { text = key .. ": " .. tostring(value), align = "tm", padding = 0.5, scale = 0.5, color = G.C.UI.OUTLINE_LIGHT }
   }
   local button_node = {
      n = G.UIT.C,
      config = { button = "balatrovocaloid_toggle_config_button", data_key = key, text_node = text_node },
      nodes = { text_node }
   }

   table.insert(config_nodes, {
      n = G.UIT.R,
      config = { align = "cm", padding = 0.1 },
      nodes = { button_node }
   })
end


-----------------------------------------------------------
-- Add buttons to config tab --
-----------------------------------------------------------

SMODS.current_mod.config_tab = function()
   return {
      n = G.UIT.ROOT,
      config = { align = "tm", padding = 0.1 },
      nodes = {
         {
            n = G.UIT.C,
            config = { align = "cm", padding = 0.1 },
            nodes = config_nodes
         }
      }
   }
end
