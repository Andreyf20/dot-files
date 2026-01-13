#!/usr/bin/env python3

from subprocess import run
from subprocess import PIPE
from subprocess import DEVNULL
from time import sleep
from sys import argv

ip_address = argv[1] if len(argv) > 1 else "8.8.8.8"
max_acceptable_ms = argv[2] if len(argv) > 2 else 80.0
print(f"Pinging address: {ip_address}")
print(f"Max acceptable ms: {max_acceptable_ms}")

sleep(2)


def notify_desktop(message: str) -> None:
    run(["notify-send", "-r", "5", "-p", message],
        stdout=DEVNULL,
        stderr=DEVNULL)


try:
    while True:
        result = run(["ping",
                      ip_address,
                      "-c",
                      "1"],
                     stdout=PIPE)
        split_result = result.stdout.decode('UTF-8').split()
        split_result = split_result[-2]  # min/avg/max/mdev
        split_result = split_result.split("/")[2]  # max_ms
        print(f"Ping result: {split_result}")

        max_value = float(split_result)

        sleep_amount = 5

        if max_value > max_acceptable_ms:
            notify_desktop("PING EXCEEDED!!!!")
            sleep_amount = 15

        sleep(sleep_amount)

except KeyboardInterrupt:
    print("Exited with interrupt from keyboard")
