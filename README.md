# AdGuard-Home Docker arm32v7

AdGuard-Home Docker container tailored for raspberry pi 2/3 (arm32v7)

## About

Installs the raspberry pi version of AdGuard-Home. Based on the rpi version of [AdGuard-Home](https://github.com/AdguardTeam/AdGuardHome). Comes with Preset configurations defined **config/AdGuardHome.yaml.sample**.

## Install

Clone this project and make the adjustments to the configuration file. Copy **config/AdGuardHome.yaml.sample** to **config/AdGuardHome.yaml**. Edit this file and add information about web interface username and password. You can maintain the remaining settings.

Build the image locally using the provided makefile

```bash
 make build
```
or using the docker command

```bash
 docker build -t adguard-home-rpi .
```

## Running

If using the makefile you can start the container in background:

```bash
 make start
```

or using the docker command:

```bash
docker run -i -t -d --rm --env-file=./config.env -p 53:53/udp -p 53:53/tcp -p=3000:3000 --name="adguard-home-rpi" adguard-home-rpi
```

To see more options for the Makefile run `make`

After the container is initialized you can access the management interface at http://localhost:3000
