---
title: "Amazfit GTS sqlite3 schema"
date: 2021-07-01T21:22:25Z
description: "Notes on my reverse engineering of the Notify for Android notify_backupA.nak export."
tags: ['amazfit']
showToc: false
TocOpen: false
draft: false
---

I recently purchased an [Amazfit GTS](https://www.amazfit.com/en/gts) as a cheap smart watch to record fitness metrics. The partnered app [Zepp (formerly Amazfit)](https://play.google.com/store/apps/details?id=com.huami.watch.hmwatchmanager) for Android devices did not appear to have any means of data export. In the pursuit of securing my digital footprint I installed an alternative app for managing the device [Notify for Amazfit](https://play.google.com/store/apps/details?id=com.mc.amazfit1), which boasts to be "privacy first". 

Notify for Amazfit offers an every-two-days backup feature (to either Google Drive or local storage) by generating a file `notify_backupA.nak`. Using `file`, it's revealed this is just a renamed `zip` archive. Unzipping the file extracts two:
* backup.bak (haven't investigated what this file is)
* backup.db (a sqlite3 schema database)
* 
