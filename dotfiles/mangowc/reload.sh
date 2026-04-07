#!/usr/bin/env bash
mmsg -d reload_config &
pkill waybar && sleep 0.1; waybar &
