FROM centos:8

LABEL \
description="app_a docker homework" \
version=1.0 \
contact="matt.a.feenstra@gmail.com"

ARG UID=${UID:-5000}
ARG USERNAME=${USERNAME:-appuser}
ARG SHA256PASS=${SHA256PASS:-$6$2xASsgW6bemivVDM$0AoGfagw2bPQ5iPD6bSitwQBSQ34Zf7QzP0eEJvvnyZcucmBYoI5xQ/xpbIRJwmctdmPFD85q52MGWMk7EdNy1}

RUN useradd -U -u $UID -G wheel -d /app_a -p $SHA256PASS $USERNAME

WORKDIR /$APPDIR

SHELL ["/bin/bash", "-c"]

ENV \
PATH .:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:$PATH

RUN dnf install -y python3 telnet net-tools

COPY files/* /app_a/
COPY config/sudoers /etc/
COPY config/config /etc/selinux/config
EXPOSE 5000

RUN /bin/pip3 install -r /app_a/requirements.txt

RUN chown -R $USERNAME:$USERNAME /app_a

USER $USERNAME

CMD /bin/python3 /app_a/app_a.py
