
# We are going to use the Latest version of Centos
FROM  centos:latest

#Set up yum repos
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install -y wget

#ssh server
RUN yum install -y openssh-server 
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN ssh-keygen -A
RUN echo "root:centos" | chpasswd

# Installing the sources for the locales
RUN  yum install -y glibc-locale-source
# Setting up the default locale to en_US.UTF-8
RUN  localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8 && \
     export LANG=en_US.UTF-8

#From Docker GUI
RUN yum install -y epel-release
RUN yum install -y epel-next-release
RUN yum config-manager --set-enabled powertools
RUN yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm
RUN yum install -y ffmpeg
RUN yum install mesa-libGL
# Installing Necessary packages including firefox
RUN  yum install -y dbus-x11 PackageKit-gtk3-module libcanberra-gtk2 
# Generating a universally unique ID for the Container
RUN  dbus-uuidgen > /etc/machine-id


#Download Intellij
RUN mkdir -p /home/app
WORKDIR /home/app
#RUN wget https://download.jetbrains.com/idea/ideaIC-2023.2.tar.gz
COPY ./ideaIC-2023.2.tar.gz /home/app
#Extract
RUN tar -xzf ideaIC-*.tar.gz -C /opt

RUN mkdir -p /scripts
COPY scripts/startup.sh /scripts/

CMD ["/bin/bash","-c","./scripts/startup.sh"]


