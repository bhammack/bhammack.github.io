---
title: "Home-server architecture"
date: "2021-10-25"
description: "A deep dive series into my home-server architecture."
tags: ['ssh', 'shell', 'linux', 'mobile']
showToc: false
TocOpen: false
draft: false
cover:
    image: https://www.techdonut.co.uk/sites/default/files/production/image/network-servers-4006808741.jpg
    # can also paste direct link from external site
    # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
    # alt: "<alt text>"
    # caption: "<text>"
    # relative: false # To use relative path for cover image, used in hugo Page-bundles
---


# How do I begin?
Great question! The first step in taking the plunge is to acquire a domain name. A domain name `wikipedia.org`, `amazon.com`, or `hammack.dev` is your ticket-to-ride in exposing your presence to the public internet and are configured through the backbone of the internet - the domain name system. [DNS records](https://www.cloudflare.com/learning/dns/dns-records/) can be thought of as the internet's phonebook, and by acquiring a domain you are adding your presences to the world.
    
## Where do I get a domain name?
You have options:
    
**I'm just looking for something casual**: 
You can use a free service such as [DuckDNS](duckdns.org) or [NoIP](noip.com) that can provide you with your own custom domain name. The limitation of these websites is that you are acquiring a subdomain and have limited configuration of your DNS records.
    
**I'm looking for something serious and long-term**: 
Purchase a domain name from a registrar, such as [Google Domains](domains.google.com), [Namecheap](namecheap.com).

    
## What do I do with my domain name?
Your next step is to create or configure an `A-record` that resolves to your server's IP address.
    
    
    