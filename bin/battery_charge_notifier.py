#! /usr/bin/env python3.9

"""
    A python module that notify you about battery charge.
    The 'dunst' package is required. See https://wiki.archlinux.org/title/Dunst
"""

import os
from time import sleep
import argparse
import psutil


get_bat = psutil.sensors_battery
get_percent = lambda: round(get_bat().percent)
is_plugged = lambda: get_bat().power_plugged


def init_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument("-d", "--delay", type=int, help="set delay of refreshing")
    parser.add_argument("-l", "--low-charged", type=int, help="set low level of the battery")
    parser.add_argument("-f", "--fully-charged", type=int, help="Value, which will be used as " +
        "the maximum of battery charge. It's not recommended to set the value greater than 98.")

    return parser


def notify(title: str, message:str):
    os.system(f"dunstify -t 10000 -a {title} -u critical {message}")


def wait_low_charge(delay: int, low: int):
    while get_percent() > low and not is_plugged():
        sleep(delay)

    if not is_plugged() and get_percent() <= low:
        notify(f"'The battery at low percentage ({get_percent()}%)'",
               "'Plug in your device otherwise it will be forcely powered off.'")

        while not is_plugged():
            sleep(delay)


def wait_full_charge(delay: int, full: int):
    while get_percent() < full and is_plugged():
        sleep(delay)

    if is_plugged():
        notify("'The battery is fully charged'", "'You can unplug your device'")
        while is_plugged():
            sleep(delay)


def wait_plugged(delay: int):
    while not is_plugged():
        sleep(delay)


def wait_unplugged(delay: int):
    while is_plugged():
        sleep(delay)


def run_once(delay:int=5000, low:int=10, full:int=100):
    if is_plugged():
        wait_full_charge(delay, full)
    else:
        wait_low_charge(delay, low)


def main():
    parser = init_parser()
    args = parser.parse_args()
    delay = 5
    low = 15
    full = 98

    if args.delay:
        delay = args.delay
    if args.low_charged:
        low = args.low_charged
    if args.fully_charged:
        full = args.fully_charged

    print(f"Delay: {delay}")
    print(f"Low: {low}")
    print(f"Full: {full}")

    while True:
        run_once(delay=delay, low=low, full=full)
        print("Ran another time")


(lambda: main() if __name__ == "__main__" else None)()

