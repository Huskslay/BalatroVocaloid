import os

def sort(a: str) -> int:
   return int(os.path.splitext(a)[0])

ALLOWED_EXTENSIONS = [".png", ".jpg", ".jpeg"]

def get_files(folder: str, skip: int) -> list[str]:
   files, skip_count = [], 0
   for file in sorted(os.listdir(folder), key=sort):
      if os.path.splitext(file)[1] not in ALLOWED_EXTENSIONS: continue
      skip_count += 1
      if skip_count > skip:
         skip_count = 0
         files.append(file)
   return files
