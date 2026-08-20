
BV.Jokers = {
   update = function(_) end,
   image_path = 'jokers/jokers.png'
}



-----------------------------------------------------------
-- Global text change --
-----------------------------------------------------------

BV.Jokers.replace_text = {
   joker="miku",
   Joker="Miku",
   JOKER="MIKU"
}



-----------------------------------------------------------
-- Jokers --
-----------------------------------------------------------

BV.Jokers.list = {
   j_reserved_parking = {
      gif = {
         size = {
            total = 255,
            columns = 17
         },
         speed = 8,
         atlas_name = 'jokers/truck.png',
         atlas = {}
      },
      text = {
         name = "Reserved Truck"
      },
      sounds = {
         show = {
            path = 'beer.wav',
            volue = 0.75
         }
      }
   },


   j_hanging_chad = {
      text = {
         name = "Hanging"
      }
   },


   j_wee = {
      text = {
         name = "Wee Little Joker"
      }
   }
}
