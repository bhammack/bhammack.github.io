---
title: "Home-server architecture - DNS"
date: "2021-10-25"
description: "A deep dive series into my home-server architecture."
tags: ['dns', 'internet', 'home-server', 'self-hosted']
showToc: false
TocOpen: false
draft: false
# cover:
#     image: https://www.techdonut.co.uk/sites/default/files/production/image/network-servers-4006808741.jpg
    # can also paste direct link from external site
    # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
    # alt: "<alt text>"
    # caption: "<text>"
    # relative: false # To use relative path for cover image, used in hugo Page-bundles
---


# How do I begin?
Great question! The first step in taking the plunge is to acquire a domain name. A domain name `wikipedia.org`, `amazon.com`, or `hammack.dev` is your ticket-to-ride in exposing your presence to the public internet and are configured through the backbone of the internet - the domain name system. [DNS records](https://www.cloudflare.com/learning/dns/dns-records/) can be thought of as the internet's phonebook, and by acquiring a domain you are adding your presence to the world.
    
## Where do I get a domain name?
You have options:
    
**I'm just looking for some casual non-committal fun**: 
You can use a free service such as [DuckDNS](https://duckdns.org) or [NoIP](https://noip.com) that can provide you with your own custom domain name. The limitation of these websites is that you are acquiring a subdomain and have limited configuration of your DNS records.
    
**I'm looking for something serious and long-term**: 
Purchase a domain name from a registrar, such as [Google Domains](https://domains.google.com), [Namecheap](https://namecheap.com), or [CloudFlare](https://cloudflare.com)
    
For my domain name management, I use CloudFlare. Keep reading to find out why!

## What do I do with my domain name?
Your next step is to create or configure an `A-record` that resolves to your server's IP address. How this is done depends on your previous option above.
* If you're using a free subdomain service like DuckDNS or NoIP, they may have provided you with a secret token. Calling their refresh API will automatically publish your IP address as the A-record.
* If you purchased your domain name from a registrar, most have a tool to guide you through the process of creating records. 

## Can I see your configuration as a reference?
Sure! As mentioned previousily, my domain name is managed through Cloudflare. This is what my DNS dashboard looks like. 
![a-records managed in CloudFlare](images/a-record.png)
In the screenshot above, I had two DNS records.
* A `CNAME` record. This record defers resolution of `hammack.dev` to `bhammack.github.io`. This is the website you are currently viewing!
* An `A` record. This record is a [Wildcard DNS record](https://en.wikipedia.org/wiki/Wildcard_DNS_record). In effect, this means any resolution of a subdomain of `hammack.dev` such as `jenkins.hammack.dev` or `photos.hammack.dev` will resolve to the IP address listed. This configuration is critical for hosting of multiple services.


## Why Wildcard DNS records? Why not fixed A records?
Because I only expose one IP address to the internet, I elected to use a wildcard DNS record. Alternatively, I could specify subdomain A-records for each of my services but this would become difficult to scale and manage. The downside of using a wildcard record is that Cloudflare cannot proxy or cache traffic destined for subdomains.
