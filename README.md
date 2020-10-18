# hypriotos-plus-raspotify
Simple setup that makes it possible to easily provision multiple Raspberry Pi's with HypriotOS + Raspotify. To easily create multiple Spotify Connect devices for home use.

## Flash an SD card
Using the HypriotOS `flash` utility the following will flash your SD card and setup the desired wifi settings. Please find more info on how to use this tool here: https://github.com/hypriot/flash.
```
flash --config ./device-init.yaml --ssid WIFI_SSID --password WIFI_PASSWORD --userdata ./user-data.yml ~/path-to_image/hypriotos-rpi-v1.12.3.img
```
