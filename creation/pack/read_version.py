import json, sys

if len(sys.argv) < 2: exit("No arguments found")

with open(sys.argv[1], "r+") as f:
   json_content = f.read()

parsed_json = json.loads(json_content)
print(parsed_json['version'])
