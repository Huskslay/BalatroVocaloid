import os, math, sys
from PIL import Image
from typing import Any
from rich.progress import Progress
from useful import get_files




if len(sys.argv) > 2: 
   in_folder = sys.argv[1]
   try: skip =  int(sys.argv[2])
   except: exit("Could not convert argument 2 to int")
   print(f"in_folder: `{in_folder}` ~ skip: {skip}")
else: 
   print("No arguments, using defaults")
   in_folder = "border_frames"
   skip = 2

OUTFILE = "../out.png"

def sort(a: str) -> int:
   return int(os.path.splitext(a)[0])



def best_grid_factors(n: int) -> tuple[int, int]:
   root = int(math.sqrt(n))
   for i in range(root, 0, -1):
      if n % i == 0:
         return n // i, i
   return 1, 1

def check_images(images: list[Any]) -> tuple[int, int] | None:
   width, height = images[0].width, images[0].height
   passed = True
   for i in range(1, len(images)):
      if images[i].width != width or images[i].height != height:
         print(f"Image `{files[i]}` does not have correct size compared to first image ({files[0]}): {images[i].width}x{images[i].height} instead of {width}x{height}")
         passed = False
   if passed: return width, height


files = get_files(in_folder, skip)

images = [Image.open(os.path.join(in_folder, x)) for x in files]
columns, rows = best_grid_factors(len(images))
size = check_images(images)
if not size: exit("Exiting due to misaligned sizess")
width, height = size[0], size[1]

passed = True
for i in range(1, len(images)):
   if images[i].width != width or images[i].height != height:
      print(f"Image `{files[i]}` does not have correct size compared to first image ({files[0]}): {images[i].width}x{images[i].height} instead of {width}x{height}")
      passed = False
if not passed: exit("Exiting due to misaligned sizess")

print(f"Converting {len(images)} images into {columns} columns and {rows} rows")

with Progress() as p:
   t = p.add_task("Processing...", total=len(files))
   output = Image.new(mode=images[0].mode, size=(width * columns, height * rows))
   for y in range(rows):
      for x in range(columns):
         for i_x in range(width):
            for i_y in range(height):
               pos = (x * width + i_x, y * height + i_y)
               pixel = images[y * columns + x].getpixel((i_x, i_y))
               output.putpixel(pos, pixel or 0.0)
         p.update(t, advance=1)
output.save(OUTFILE)
print("Done")