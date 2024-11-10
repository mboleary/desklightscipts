# Desk Light Scripts

This is a collection of scripts that manage my desk lights in relation to my computer's screen lock state. These scripts call the Shelly's REST API to control the light.

## Requirements

- a Shelly RGBW2

## Usage

`desk_light_set` - This script changes settings on the Shelly.
- `-t|--turn <on|off>`: Turns the light on or off
- `-r|--red <value>`: Sets the red channel, value should be between 0 and 255
- `-g|--green <value>`: Sets the green channel, value should be between 0 and 255
- `-b|--blue <value>`: Sets the blue channel, value should be between 0 and 255
- `-w|--white <value>`: Sets the white channel, value should be between 0 and 255

`desk_light_monitor` - Script that monitors the system screen lock state to turn the light on and off automatically

`desk_light_on` - Script that turns the desk light on

`desk_light_off` - Script that turns the desk light off

## Install

- Copy binaries into a directory in `$PATH`
- Copy and modify Systemd unit file
    - Install this as a user unit in `~/.config/systemd/user`
    - Ensure that your `$PATH` environment variable includes all of the binaries