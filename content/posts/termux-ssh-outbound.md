---
title: "Setting up Cloudflared with Termux"
date: "2021-08-29"
# description: "Configuring a host to maintain a persistent reverse ssh tunnel"
tags: ['ssh', 'shell', 'linux', 'mobile']
showToc: false
TocOpen: false
draft: false
# cover:
#     image: https://tunnelingonline.com/wp-content/uploads/2020/08/tunnel-under-construction.jpg
    # can also paste direct link from external site
    # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
    # alt: "<alt text>"
    # caption: "<text>"
    # relative: false # To use relative path for cover image, used in hugo Page-bundles
---

After recently upgrading my daily mobile device, I was left with an unlocked SIM-less Samsung Galaxy S7. After extensive research, it appears the model that I own is bootloader-locked, which prevents me from installing any alternative operating systems such as LineageOS.

`pkg update` update repos

`pkg install openssh` to install openssh

`sshd` to start the ssh daemon, listening for connections on port 8022

`passwd` on termux to set a password https://wiki.termux.com/wiki/Remote_Access

`ssh -p 8022 10.0.0.88` on remote host


`cloudflared tunnel route dns sshtunnel pixel.hammack.dev` create the cname record in your hosted zone


