import os
import random
import re
from subprocess import call
from sys import argv

path = argv[1]
if not os.path.isfile(path) and path != "random":
    print("ERROR!")
    print(f"File does not exist, check the path: '{path}'")
    exit(1)

if path == "random":
    default_path = os.path.expanduser("~/Pictures/mywallpapers/")
    pictures = os.listdir(default_path)
    filtered_pictures = [x for x in pictures if re.match(r"^.*\.[^.]+$", x)]
    random_picture = filtered_pictures[random.randrange(0, len(filtered_pictures))]
    path = default_path + random_picture

# Example of awww usage:
# awww img <path> --transition-type grow --transition-duration 1 --transition-fps 60
result = call(
    [
        "awww",
        "img",
        f"{path}",
        "--transition-type",
        "grow",
        "--transition-duration",
        "1.0",
        "--transition-fps",
        "60",
    ]
)

print(result)
