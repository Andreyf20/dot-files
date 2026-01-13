#!/usr/bin/env python3

from typing import List
from subprocess import run
from subprocess import PIPE
from subprocess import DEVNULL
from datetime import datetime
from time import sleep
from sys import argv
import os

ip_address = argv[1] if len(argv) > 1 else "8.8.8.8"
max_acceptable_ms = argv[2] if len(argv) > 2 else 80.0
print(f"Pinging address: {ip_address}")
print(f"Max acceptable ms: {max_acceptable_ms}")


def create_log(start_time: datetime,
               end_time: datetime,
               values: List[float]) -> None:
    if len(values) < 2:
        return
    logs_dir = os.path.expanduser(
        "~/.config/personal_scripts/check_ping_logs/")
    os.makedirs(logs_dir, exist_ok=True)
    with open(logs_dir+f"log_{start_time}_{end_time}.txt", "w") as log:
        values_avg = sum(values) // len(values)
        values_sorted = sorted(values)
        values_max = values_sorted[-1]
        values_mean = values_sorted[len(values) // 2]
        log.write(f"Start Time: {start_time}\n")
        log.write(f"End Time: {end_time}\n")
        log.write(f"Average: {values_avg}\n")
        log.write(f"Max: {values_max}\n")
        log.write(f"Mean: {values_mean}\n")


def notify_desktop(message: str) -> None:
    run(["notify-send", "-r", "5", "-p", message],
        stdout=DEVNULL,
        stderr=DEVNULL)


try:
    start_time = None
    end_time = None
    previous_borked = False
    values = []
    while True:
        result = run(["ping",
                      ip_address,
                      "-c",
                      "1"],
                     stdout=PIPE)
        result = result.stdout.decode('UTF-8')
        result_split = result.split()
        ping_data = result_split[-2]  # min/avg/max/mdev
        ping_data = ping_data.split("/")
        if len(ping_data) < 4:
            print(f"Error parsing the result: {result}")
            continue

        max_value = ping_data[2]  # max

        print(f"Ping result: {max_value}")

        max_value = float(max_value)

        sleep_amount = 5

        if max_value > max_acceptable_ms:
            if previous_borked is False:
                start_time = datetime.now()
                notify_desktop("PING EXCEEDED!!!!")
            previous_borked = True
            values.append(max_value)
            sleep_amount = 15
        else:
            if previous_borked:
                end_time = datetime.now()
                create_log(start_time, end_time, values)
                values.clear()
            previous_borked = False

        # Failsafe in case ping never goes back down
        # so i don't grow values indefinitely
        if len(values) > 99:
            end_time = datetime.now()
            create_log(start_time, end_time, values)
            values.clear()
            previous_borked = False

        sleep(sleep_amount)

except KeyboardInterrupt:
    print("Exited with interrupt from keyboard")
