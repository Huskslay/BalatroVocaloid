import os, sys
from PIL import Image
from rich.progress import Progress
from useful import get_files, ALLOWED_EXTENSIONS

if len(sys.argv) > 1: 
   try: skip =  int(sys.argv[1])
   except: exit("Could not convert argument 2 to int")
   print(f"Skip: {skip}")
else: 
   print("No arguments, using default skip")
   skip = 2


INFOLDER = "frames"
OUTFOLDER = "border_frames"
BORDER = "../border.png"



if not os.path.exists(OUTFOLDER): os.mkdir(OUTFOLDER)
for file in os.listdir(OUTFOLDER):
   path = os.path.join(OUTFOLDER, file)
   if os.path.splitext(path)[1] in ALLOWED_EXTENSIONS:
      os.remove(os.path.join(OUTFOLDER, file))


border = Image.open(BORDER).convert("RGBA")
files = get_files(INFOLDER, skip)
if len(files) == 0:
   exit("No files found")
print(f"Converting {len(files)} images")

with Progress() as p:
   t = p.add_task("Processing...", total=len(files))
   for file in files:
      p.update(t, advance=1)
      image = Image.open(os.path.join(INFOLDER, file))
      if image.width != border.width or image.height != border.height:
         exit(f"File `{file}` does not match border size: {image.width}x{image.height} instead of {border.width}x{border.height}")

      new = Image.new(mode="RGBA", size=(border.width, border.height))
      for x in range(image.width):
         for y in range(image.height):
            pixel = border.getpixel((x, y))
            if pixel == (255, 0, 0, 100): continue
            if isinstance(pixel, tuple) and len(pixel) == 4 and pixel[3] != 0: 
               new.putpixel((x, y), pixel or 0.0)
            else: new.putpixel((x, y), image.getpixel((x, y)) or 0.0)
      new.save(os.path.join(OUTFOLDER, file))
print("Done")