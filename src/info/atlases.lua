
BV.Atlases = {}


-----------------------------------------------------------
-- Icon --
-----------------------------------------------------------

BV.Atlases.modicon = {
   path = 'modicon.png',
   px = 32,
   py = 32,
}



-----------------------------------------------------------
-- UI --
-----------------------------------------------------------

if BV.MOD.config.change_icons then

   BV.Atlases.ui_1 = {
      path = 'ui/ui_assets_lc.png',
      px = 18,
      py = 18,
      prefix_config = {key = false},
   }

   BV.Atlases.ui_2 = {
      path = 'ui/ui_assets_hc.png',
      px = 18,
      py = 18,
      prefix_config = {key = false},
   }

end

