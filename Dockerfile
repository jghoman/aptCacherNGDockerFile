FROM ubuntu:14.04
MAINTAINER Jakob Homan <jghoman@gmail.com>

RUN apt-get update

RUN apt-get install -y apt-cacher-ng

RUN sed -i 's/^# BindAddress:.*/BindAddress: 0.0.0.0/' /etc/apt-cacher-ng/acng.conf

RUN service apt-cacher-ng restart

# Disable SSH server started by phusion/baseimage
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

EXPOSE 3142

ENTRYPOINT /usr/sbin/apt-cacher-ng
