from taste:latest

#CUSTOMIZATIONS
#install additional software
RUN apt-get update && apt-get -y install aptitude gedit ruby-dev gitk xvfb

#restore ssh key
# adds a script which autostarts with the bash shell and tries to copy a ssh keypair from the host to the docker guest. This is intended for git access mostly, but can of course be used in any way.

#ADD ./configure-ssh.sh /root/
#RUN bash -c 'chmod +x /root/configure-ssh.sh ; echo "./configure-ssh.sh" >> /root/.bashrc'

#configure git
#RUN bash -c 'git config --global user.email your.email@server.com ; git config --global user.name ESROCOS USER '


# Download ESROCOS install script and make it executable
ADD https://raw.githubusercontent.com/ESROCOS/buildconf/master/install_esrocos /root/install_esrocos
RUN bash -c 'cd /root/ ; chmod +x install_esrocos;'


#
#
# At this point, you can start a fresh TASTE container with proper X11 redirection, with...
#
#     ./Docker-run.sh
#
