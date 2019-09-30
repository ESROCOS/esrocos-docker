# esrocos-docker
Dockerfile and run script for dockerized esrocos installation

__USAGE__

Follow the TASTE docker installation instructions found here: https://taste.tools/

use ```sudo docker images``` to check if the image named ```taste:latest``` was correctly installed. Subsequently, clone this repo into an own folder and use ```sudo docker build -t esrocos .``` to create an esrocos image. 

Run the image using the ```sudo ./run.sh esrocos:latest``` command script which will open a docker container with the taste image and esrocos install script. Within the container run the ```./install_esrocos``` script and follow the ESROCOS installation instructions.

After the successfull installation use ```sudo docker commit esrocos esrocos:latest``` from a different console outside of the container to commit the installation to the esrocos docker image.

Normal working with docker containers includes taking care to either commit your work within the container via the command mentioned above or working in the host $HOME folder which the taste image mounts under /root/work.

The container has to be deleted and started anew from a saved image for X GUI support to run robustly.
