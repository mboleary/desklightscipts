#!/bin/bash

# Monitor the screen lock state to turn desk light on and off

dbus-monitor --session "type='signal',interface='org.freedesktop.ScreenSaver'" |
  while read x; do
    case "$x" in 
      # You can call your desired script in the following line instead of the echo:
      *"boolean true"*) desk_light_off;;
      *"boolean false"*) desk_light_on;;  
    esac
  done
