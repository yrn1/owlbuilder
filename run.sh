#!/bin/sh

mkdir build
docker run -ti --rm -v ${PWD}/patches:/OwlProgram/PatchSource -v ${PWD}/build:/OwlProgram/Build owlbuilder /bin/bash -l