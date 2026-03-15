# switchbot-dockerized
[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/)

# About this project

- Forked from https://github.com/OpenWonderLabs/python-host
- Dockerized to run on an Ubuntu host with Bluetooth Low Energy support
- Made various improvements

## Security model and warning

This container is provided for packaging and convenience. It is not intended to isolate the workload from the host.

The default runtime configuration gives the container direct access to host interfaces that are required for Linux BLE operation:

- `--network host`
- `--cap-add NET_ADMIN`
- `--cap-add NET_RAW`
- `-v /var/run/dbus:/var/run/dbus`

As a result, you should treat this container the same way you would treat running `python3 switchbot_py3.py` directly on the host with access to the host Bluetooth stack and host D-Bus.

Before using it, assume the following:

- The code running in the container is trusted to interact with host services.
- A compromise of the container can have host impact through the mounted D-Bus socket and granted capabilities.
- This setup is not a security boundary and should not be used to run untrusted code.
- The image, dependencies, and this repository should be reviewed with the same care as any host-installed software.

If you need isolation, use a different design. This project assumes direct host integration is acceptable for the intended environment.

## How to Install?

### Host requirements
You will need:
  - An Ubuntu host with a working Bluetooth Low Energy adapter.
  - On a Raspberry Pi 3, the built-in Bluetooth adapter is usually sufficient.
  - On a non-Raspberry Pi host, use a BLE-capable USB dongle that is supported by BlueZ on Linux.
  - A SwitchBot.
  - A fresh Ubuntu installation (tested with Ubuntu 22.04).

This project is not Raspberry Pi specific. It uses the standard Linux Bluetooth stack through BlueZ and expects a host adapter such as `hci0` to be available to the container.

### Installation
1. Boot your Ubuntu host and open a command prompt.
2. Install Docker on Ubuntu by following the official instructions:
   https://docs.docker.com/engine/install/ubuntu/
3. Make sure the Bluetooth adapter is available on the host.
4. Clone this repo to the host.

```sh
git clone https://github.com/bedemiralp/switchbot-dockerized
cd switchbot-dockerized
```

5. Use the included bash scripts to build and run the container.

```sh
./build-container.sh
./start-container.sh
```

The container is started with host networking, Bluetooth capabilities, and the host D-Bus socket mounted. Those assumptions are required for both Raspberry Pi and non-Raspberry Pi Ubuntu hosts.

## References

[SwitchBotAPI-BLE](https://github.com/OpenWonderLabs/SwitchBotAPI-BLE) 

- [Bot BLE open api](https://github.com/OpenWonderLabs/SwitchBotAPI-BLE/blob/latest/devicetypes/bot.md)

- [Meter BLE open api](https://github.com/OpenWonderLabs/SwitchBotAPI-BLE/blob/latest/devicetypes/meter.md)

- [Curtain BLE open api](https://github.com/OpenWonderLabs/SwitchBotAPI-BLE/blob/latest/devicetypes/curtain.md)

- [Contact Sensor BLE open api](https://github.com/OpenWonderLabs/SwitchBotAPI-BLE/blob/latest/devicetypes/contactsensor.md)

- [Motion Sensor BLE open api](https://github.com/OpenWonderLabs/SwitchBotAPI-BLE/blob/latest/devicetypes/motionsensor.md)

## Thanks to contributors
[@BlackLight](https://github.com/BlackLight)

[@rcmdnk](https://github.com/rcmdnk)

[@tony-wallace](https://github.com/tony-wallace)
