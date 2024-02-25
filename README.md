# Docker-based OWL patch builder

This repository contains a basic procedure to build OWL patches offline, using Docker.
All inspiration comes from https://github.com/RebelTechnology/OwlProgram.

**NOTE: this has only been tested with a Befaco Lich module, and only with Faust patches. I will happily accept PR's that expand and improve on this!**


## Installation

* Install and run [Docker](https://www.docker.com). Docker Desktop on a Mac M1 works fine.
* Download [FirmwareSender](https://github.com/pingdynasty/FirmwareSender/releases/tag/v0.1). I'm using `v0.1`, since there is a binary download for Mac.
* Build image with `./build.sh`. This will take a while.

## Compiling patches

* Run image with `./run.sh`
* When you get a prompt like `root@09c1f9c5ada4:/#` in the Docker container, execute the following:
  * `cd OwlProgram`
  * `make clean libs`
    Ignore the build failure because `/bin/sh: 1: emcc: not found`. This is because emscripten is not installed. Could not get it to work anyway...
  * `make FAUST=sine-c clean patch`

For more targets and options, see https://github.com/RebelTechnology/OwlProgram.

## Installing patches

The following commands should not be executed inside the Docker comtainer.

To install on Lich (you might want to specify the correct path to FirmwareSender):
* `cd build`
* `FirmwareSender -in patch.bin -out OWL-LICH -run`

To save on Lich (slot 1 in this example):
* `cd build`
* `FirmwareSender -in patch.bin -out OWL-LICH -run -store 1`

For more options of FirmwareSender, run `FirmwareSender -h`.