#!/bin/sh

# Stop background user services
pgrep -u dsilva pipewire | xargs kill
pgrep -u dsilva mako | xargs kill

swaymsg exit
