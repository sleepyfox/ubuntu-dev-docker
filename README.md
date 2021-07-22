# ubuntu-dev-docker

A docker development image to take my development environment with me, wherever I go.

The idea is that whatever machine that you're on, if you have docker you can download a dev env to your local host and work in a container that reflects how you like your development environment to be.

> make all

This will build and push the image to your docker hub account. You'll need to `docker login`. Obviously don't forget to change the username in the Makefile to your own dockerhub username.

The image includes Tmux, git, build-essential and ssh, and copies in your local .bash_aliases and .emacs config.

You can start the container with a local volume map by doing something like:

> docker run -it -v `pwd`:/var/app your-name/ubuntu-dev

There's a shortcut for this as `make run`. If you're on Windows you may need to alter the backquoted pwd command.
