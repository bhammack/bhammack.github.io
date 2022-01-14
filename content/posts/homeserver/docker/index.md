---
title: "Home-server architecture - Docker"
date: "2021-10-26"
description: "A deep dive series into my home-server architecture."
tags: ['docker', 'internet', 'home-server', 'self-hosted']
showToc: false
TocOpen: false
draft: false
cover:
    image: https://cbsnews1.cbsistatic.com/hub/i/r/2012/01/10/0059c57b-a644-11e2-a3f0-029118418759/thumbnail/1200x630/10dc70252db7abf30fc6abb042364c95/NZ_136581961.jpg
---

Nearly everything hosted on my home server is executed and managed as a collection of docker containers and configurations. This entire stack is versioned through a private git repository in order to version and encapsulate the composition, configuration, and integrations in one place. Within this repo lies one docker-compose.yml that describes all my services (though at this point, I am pursuing decomposing this file into multiple stacks as it's growing quite cumbersome to maintain).

## Can I see it?

```
<generate Tee of repo here>
```


## What services do you run in Docker?
* PiHole
* Trilium
* Jenkins
* NodeRed
* Home Assistant
* Cloudflare DDNS 
* Gitea
and more!

## What have you changed on the host machine?

**DNS** The default DNS resolver for Ubuntu. Traditionally, Linux operating systems utilize `/etc/hosts` for local name resolution. However, Ubuntu thinks it knows what's best for you, and implemented their own resolver services. I disabled this service by:

```
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
# Then modify the resolv file to change the default nameserver address.
sudo nano /etc/resolv.conf # change nameserver 127.0.0.53 to 127.0.0.1
```
