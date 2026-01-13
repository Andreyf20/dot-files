#!/usr/bin/env python3

from typing import List
from subprocess import run
from subprocess import PIPE
from subprocess import DEVNULL
from datetime import datetime
from time import sleep
from sys import argv
import os


def get_arguments(argv: List[str], arg_name: str, default_arg: str) -> str:
    index = argv.index(arg_name) if arg_name in argv else -1
    if index > -1:
        try:
            return argv[index + 1]
        except IndexError:
            return default_arg
    return default_arg


ip_address = get_arguments(argv, "-ip", "8.8.8.8")
max_acceptable_ms = float(get_arguments(argv, "-maxms", "80.0"))
sleep_seconds = int(get_arguments(argv, "-sleep", 5))
sleep_seconds = max(sleep_seconds, 1)
sleep_offset = int(get_arguments(argv, "-offset", 15))
sleep_offset = min(sleep_offset, 15)
print(f"Pinging address: {ip_address}")
print(f"Max acceptable ms: {max_acceptable_ms}")
print(f"Ping Interval: {sleep_seconds} second(s)")
print(f"Offset when lagging: {sleep_offset} second(s)")


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

        sleep_amount = sleep_seconds

        if max_value > max_acceptable_ms:
            if previous_borked is False:
                start_time = datetime.now()
                notify_desktop("PING EXCEEDED!!!!")
            previous_borked = True
            values.append(max_value)
            sleep_amount = sleep_offset
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
