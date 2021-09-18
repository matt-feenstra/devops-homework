FROM centos:8

LABEL \
description="app_b docker homework" \
version=1.0 \
contact="matt.a.feenstra@gmail.com"

ARG UID=${UID:-5000}
ARG USERNAME=${USERNAME:-appuser}
ARG SHA256PASS=${SHA256PASS:-$6$2xASsgW6bemivVDM$0AoGfagw2bPQ5iPD6bSitwQBSQ34Zf7QzP0eEJvvnyZcucmBYoI5xQ/xpbIRJwmctdmPFD85q52MGWMk7EdNy1}

RUN useradd -U -u $UID -G wheel -d /app_b -p $SHA256PASS $USERNAME

WORKDIR /app_b

SHELL ["/bin/bash", "-c"]

ENV \
PATH .:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:$PATH

RUN dnf install -y python3 sqlite telnet net-tools

COPY files/* /app_b/
COPY config/sudoers /etc/
COPY config/config /etc/selinux/config
EXPOSE 5001

RUN /usr/bin/sqlite3 /app_b/database.db < /app_b/schema.sql

RUN /bin/pip3 install -r /app_b/requirements.txt

RUN chown -R $USERNAME:$USERNAME /app_b

USER $USERNAME

CMD /bin/python3 /app_b/app_b.py
