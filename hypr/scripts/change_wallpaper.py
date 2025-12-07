import os
from subprocess import call
from sys import argv

path = argv[1]
if not os.path.isfile(path):
    print("ERROR!")
    print(f"File does not exist, check the path {path}")
    exit(1)

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
