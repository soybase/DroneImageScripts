ImageBreed DroneImageScripts
===

This repository contains all Python drone image processing scripts which are used by the ImageBreed (http://imagebreed.org) plant breeding and genetics image processing web-database pipeline. The web-database is based on the BreedBase open-source system for plant breeding and genetics (https://github.com/solgenomics/sgn)

To pull in and run a standalone docker image, so that you can use these scripts, use the following command. This docker image has OpenCV and all other dependencies installed (https://hub.docker.com/r/nmorales3142/imagebreeddroneimagescripts).

`sudo docker run -t -d nmorales3142/imagebreeddroneimagescripts:1.02`

To enter running docker container, where all DroneImageScripts are runnable:

`sudo docker exec -it CONTAINERID bash`

Alternatively, to build fresh standalone docker image, so that you can use these scripts, use the following command. This docker image has OpenCV and all other dependencies installed.

`sudo docker build -t imagebreeddroneimagescripts .`

To run a script in the container, allowing access to the current working directory in the container, invoke docker as follows, specifing the path to the script as `/app/<path>`, where `<path>` is the path to the script with respect to the root of the git working tree:

`sudo docker run -it --rm -v $PWD:/mnt -w /mnt imagebreeddroneimagescripts python3 /app/CNN/CNNProcessData.py`
