# apt-get for CentOS

This is a simple `apt-get` interface for managing packages in CentOS. It's going to be useful for CentOS adopters who came from Ubuntu world.

## Installation

    curl https://raw.githubusercontent.com/dvershinin/apt-get-centos/master/apt-get.sh -o /usr/local/bin/apt-get
    chmod 0755 /usr/local/bin/apt-get

## Usage

Usage is similar to what you would normally type in Ubuntu. Please note, this is convinience learning interface rather than something that you should always use. 
When you run a `apt-get` command, it will run the equivalent `yum` command.

### Install a package

    apt-get install nginx

### Remove a package

    apt-get remove nginx

## Purge a package

    apt-get purge nginx
