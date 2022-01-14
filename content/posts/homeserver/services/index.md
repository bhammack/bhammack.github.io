---
title: "Home-server architecture - Services"
date: "2021-12-12"
description: "A deep dive series into my home-server architecture."
tags: ['dns', 'internet', 'home-server', 'self-hosted']
showToc: false
TocOpen: false
draft: false
cover:
    image: https://www.europarl.europa.eu/resources/library/images/20200928PHT88015/20200928PHT88015_original.jpg
---

As described in the previous post, nearly all the software running on my home server is managed through docker containers. In this post, I'll deep dive some of the service I run, and integrations I've created between containers.


## Core services

The heart of the ability to self-host web applications is [Traefik](https://traefik.io/traefik/), a fantastic docker-first reverse proxy. Traefik is the secret sauce that allows me to expose multiple web apps - each under their own subdomain - despite only having one public IP from my internet service provider. By writing entry point rules for each service definition within `docker-compose.yml`, Traefik will route traffic to the appropriate container. In addition to reverse proxying, Traefik also handles generation of Let's Encrypt certificates for all subdomains (via wildcard cert), auto-upgrades clients from http to https, and facilitates plugins for other middleware. 

To protect against unauthorized access to my applications, Traefik is running with an authentication middleware known as [Authelia](https://www.authelia.com/). This middleware guards access by implementing forward authentication. Clients are promoted to log in when accessing a domain that is protected if they do not already have an authentication cookie. Authelia offers both single-factor and multi-factor authentication methods, and is as easy to incorporate for any container as adding a label within `docker-compose.yml`. 

A common challenge that I experience with this configuration however is that many applications prefer to manage their own user database. Any user (myself) would need to log in to Authelia first, then to the respective application (such as Jenkins, Portainer, Jellyfin, etc), which quickly gets irritating remembering passwords despite the user already passing the server-wide authentication check. Authelia itself is *not* an identity provider; only an authentication server. To resolve this issue and make the entire stack more open to scale, I established a private LDAP server to serve user identities using [OpenLDAP](https://github.com/osixia/docker-openldap). This brings the added benefit of integrating directly with applications that consume LDAP queries as authorization sources. 

*Side note* - It's often necessary to disable authentication or force a single-user mode within web applications protected by Authelia. Forward auth isn't a new strategy, so fortunately many applications offer the ability to do this, however it's typically an option buried in settings and not enabled by default.

## Administrative services

Portainer
Web ssh
VScode



## Services


### Minecraft
I run a minecraft game server

### PiHole
> network wide DNS black hole

### Node-RED
> describe all the custom flows you've created

### Home Assistant
> this is what got me into self hosting

### Jenkins
> various jobs and operations






### Other services
**Portainer** - a simple docker container management web application. 
**Gotify** - a self-hosted push notification platform that provides a variety of integration points for other services.
