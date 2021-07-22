FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && apt -yq upgrade
RUN apt -yq install tmux build-essential emacs-nox ssh git man-db

COPY .emacs /root
COPY .bash_aliases /root

# Set group and user IDs for docker user
ARG GID=1000
ARG UID=1000
ARG USER=me

# Create the group and user
RUN groupadd -g $GID $USER
RUN useradd -g $GID -M -u $UID -d /var/app $USER

# Application setup
WORKDIR /var/app
# RUN chmod 777 /var/app
USER $USER
