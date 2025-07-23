# TBStreamer

TBStreamer is a collection of Python scripts that use GStreamer to stream audio and video between two locations.  The project is organized into sender, server and receiver components which communicate using SRT.

## Directory overview

- **1_sender/** – Scripts for capturing and sending audio/video.
- **2_server/** – Server that relays and records streams.
- **3_receiver/** – Scripts for receiving and displaying video.
- **config.yaml** – Central configuration file for IP addresses, ports and media settings.
- **setup.sh** – Installs the required system and Python dependencies.

## Setup

1. Run `./setup.sh` on a Debian/Ubuntu system to install dependencies.
2. Adjust `config.yaml` to match your environment (server IP, ports, audio/video options).

## Usage

### Start the server
```
python3 2_server/server.py
```
The server relays SRT streams and stores the video files on shutdown.

### Start a sender
```
python3 1_sender/send.py --country tn
```
When launched you can optionally start the audio sender in a subprocess. Replace `tn` with `dk` to use the Danish configuration.

### Start a receiver
```
python3 3_receiver/receive.py --country tn
```
The receiver displays the video and automatically switches to a fallback pattern if the stream stops.

## Utilities

- `kill.py` – Terminates any processes that are using the ports defined in the configuration.
- `2_server/modules/` – Additional helper scripts for recording streams and checking port status.

## Requirements

The main dependencies (GStreamer, PyGObject, OpenCV and others) are installed by `setup.sh`. A minimal set is also listed in `requirements.txt`.

## License

This repository does not currently contain explicit license information.
