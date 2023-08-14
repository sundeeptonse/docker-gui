
# We are going to use the Latest version of Centos
FROM  centos:latest

#Set up yum repos
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Installing the sources for the locales
RUN  yum install -y glibc-locale-source
# Setting up the default locale to en_US.UTF-8
RUN  localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8 && \
     export LANG=en_US.UTF-8
#Some other Packages 
#https://stackoverflow.com/questions/55313610/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directo
#Couldn't open libGL.so.1: libGL.so.1: cannot open shared object file: No such file or directory
RUN yum install -y epel-release
RUN yum install -y epel-next-release
RUN yum config-manager --set-enabled powertools
RUN yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
#RUN yum install -y libsm6 libxext6
RUN yum install -y ffmpeg
RUN yum install mesa-libGL

# Installing Necessary packages including firefox
RUN  yum install -y dbus-x11 PackageKit-gtk3-module libcanberra-gtk2 firefox
# Generating a universally unique ID for the Container
RUN  dbus-uuidgen > /etc/machine-id
# Starting Firefox application
CMD ["tail", "-f", "/dev/null"]


#References :: 
#https://medium.com/geekculture/run-a-gui-software-inside-a-docker-container-dce61771f9
#https://github.com/moby/moby/issues/8710
#https://www.howtogeek.com/devops/how-to-run-gui-applications-in-a-docker-container/

#https://blog.alexellis.io/linux-desktop-on-mac/
#https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc

##Commands to Run
##Build
#docker build -t docker-gui-ff:1.0 .

##Run
#docker run -e DISPLAY=$DISPLAY \
#-v /tmp/.X11-unix/:/tmp/.X11-unix/ \
#--name firefox \
#docker-gui-ff:1.0



#docker run -e DISPLAY=10.0.0.142:0 --privileged jess/tor-browser
#++
#socat
