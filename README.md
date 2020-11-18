# shell:~# -- Docker/Kubernetes WebInterface Shell Access

shell:~# is a very basic, single-file, PHP shell. It can be used to quickly execute commands on a server. Use it with caution: this script represents a security risk for the server.

**Features:**

* Command history (using arrow keys `↑` `↓`)
* Auto-completion of command and file names (using `Tab` key)
* Navigate on the remote file-system (using `cd` command)
* Upload a file to the server (using `upload <destination_file_name>` command)
* Download a file from the server (using `download <file_name>` command)

**NOTE:** Do not run infinite commands as the output is only shown once the command returns 

**WARNING:** THIS SCRIPT IS A SECURITY HOLE. **DO NOT** UPLOAD IT ON A SERVER UNTIL YOU KNOW WHAT YOU ARE DOING!

![Screenshot](./screenshot.png)

**Installed tools**
* apk package manager
* Nginx Web Server (port 80, port 443) - customizable ports!
* wget, curl, httpie, iperf3
* dig, nslookup
* ip, ifconfig, ethtool, mii-tool, route
* ping, nmap, arp, arping, arpwatch
* awk, sed, grep, cut, diff, wc, find, vi, vim, nano
* ps, netstat, ss
* gzip, cpio
* tcpdump, wireshark, tshark
* telnet client, ssh client, ftp client, rsync, scp
* traceroute, tracepath, mtr, tcptraceroute
* nload, tcpflow, nethogs, iftop
* netcat (nc), socat
* ApacheBench (ab)
* mysql & postgresql client
* jq
* git

**Demo with Docker:**

Build locally and run

        docker build -t network-tools-web .
        docker run -it -p 8080:80 -d network-tools-web
        # open with your browser http://127.0.0.1:8080/shell.php

Makefile helpers

        help                           This help
        build                          Build the container
        build-nc                       Build the container without caching
        run                            Run container
        sh                             Run interactive shell in container
        up                             Build and run container on port configured
        stop                           Stop and remove a running container
        release                        Make a full release
        publish                        Publish the $VERSION and latest tagged containers

Run from dockerhub

        docker run -it -p 8080:80 -d boeboe/network-multitool-web
        # open with your browser http://127.0.0.1:8080/shell.php

## Changelog

* **2020-11-18:** Initial release
