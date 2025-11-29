import os
from subprocess import call
from sys import argv

path = argv[1]
if not os.path.isfile(path):
    print("ERROR!")
    print(f"File does not exist, check the path {path}")
    exit(1)

monitor = "DP-3" if len(argv) < 3 else argv[2]

call(["hyprctl", "hyprpaper", "preload", f"{path}"])
result = call(["hyprctl", "hyprpaper", "wallpaper", f"{monitor},{path}"])

print(result)
