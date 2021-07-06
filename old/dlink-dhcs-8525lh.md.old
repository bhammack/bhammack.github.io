---
title: Hacking the D-Link DHCS-8525LH into Home Assistant
date: "2020-07-26"
linktitle: Creating a New Theme
categories:
- development
tags:
- home assistant
- http
- rtsp
---

My father recently has been looking to migrate his existing IP camera patchworked-system into Home Assistant as a central viewing location for all IoT devices. As part of this, he purchased a D-Link DHCS-8525LH wireless IP camera as an upgrade for an older generic knockoff unit. However unbeknownst to him, the camera is tightly coupled to the manufacturer's proprietary app, and doesn't allow for access outside their ecosystem...

... or does it?...

Evidence found [on the D-Link user forms](http://forums.dlink.com/index.php?topic=72715.0) suggests that D-Link customer support typically denies requests for integration endpoints. I figure these requests are either denied by an agenda, or customer support doesn't have these details on hand per device.

Nevertheless, some users noted integration points of previous models of IP cameras to follow some of these formats:
```
http://[username]:[password]@XXX.XXX.XXX.XXX/image/jpeg.cgi
http://admin:<password>@<ip address>/video/ACVS-H264.cgi?profileid=1
http://admin:<password>@<ip address>/av2/ACAS-ULAW.cgi
http://[username]:[password]@XXX.XXX.XXX.XXX/video/flv.cgi
http://[username]:[password]@XXX.XXX.XXX.XXX/av2/flv.cgi
```

So it looks promising! The camera after all would need to expose some kind of standard encoded video endpoint to be consumed by the application. Testing out these curls with username: admin and password: <blank> yielded no results though.

Further digging found [this forum post](http://forums.dlink.com/index.php?topic=74541.0) documenting excellent camera details by a user who seemed disgruntled by the lack of information, which happend to be the exact same camera in question! The posts insists though that the password field should be blank. Hitting these endpoints with the expected credentials didn't provide any video feeds, only 401 responses, so it seems I was out of luck.

When combing over the details the next day, I recalled a previous IP camera in the past created by an offbrand compnay that used it's model number as the password of the camera (super secure, I know). With this value in hand, I gave it a shot again...

And it worked! The camera was in fact exposing a FFMPEG stream on the endpoint. This endpoint was simply added as a camera device to home assistant, which was able to render it in browser.
```
http://admin:748832@192.168.X.X/video/flv.cgi
```

In conclusion though, one fine detail broke the system after a few days use. In the forums post above, it was mentioned that these endpoints were exposed by a previous iteration of the firmware, so an update may close them off -- this happend to be true. Since the camera was initialized to the network by means of the proprietary app, it apperas to have issued an auto-update sequence during the night which has locked the device down again :(. All in all though, this was a great excercise in problem solving!

