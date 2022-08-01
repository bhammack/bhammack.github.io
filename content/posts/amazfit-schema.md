---
title: "Amazfit GTS sqlite3 Schema"
date: "2021-07-01"
description: "Reverse engineering notes on a foreign database schema"
tags: ['amazfit']
showToc: false
TocOpen: false
draft: false
# cover:
#     image: https://site-cdn.huami.com/files/amazfit/en/gts/section-4.jpg
    # can also paste direct link from external site
    # ex. https://i.ibb.co/K0HVPBd/paper-mod-profilemode.png
    # alt: "<alt text>"
    # caption: "<text>"
    # relative: false # To use relative path for cover image, used in hugo Page-bundles
---

I recently purchased an [Amazfit GTS](https://www.amazfit.com/en/gts) as a cheap smart watch to record fitness metrics. The partnered app [Zepp (formerly Amazfit)](https://play.google.com/store/apps/details?id=com.huami.watch.hmwatchmanager) for Android devices did not appear to have any means of data export. In the pursuit of securing my digital footprint I installed an alternative app for managing the device [Notify for Amazfit](https://play.google.com/store/apps/details?id=com.mc.amazfit1), which boasts to be "privacy first". 

Notify for Amazfit offers an every-two-days backup feature (to either Google Drive or local storage) by generating a file `notify_backupA.nak`. Using `file`, it's revealed this is just a renamed `zip` archive. Unzipping the file extracts two:
* `backup.bak UTF-8 Unicode text, with very long lines, with no line terminators`
* `backup.db SQLite 3.x database, user version 18, last written using SQLite version 3018002`

Opening `backup.db` in a sqlite3 database explorer, we can see the following tables and indicies
![index](https://imgur.com/a8grUuK.png)

However inspecting each table individually, I see that some are empty:
```
Spo2Data - empty
StressData - empty
android_metadata - only contains one entry, "en_US"
rush_co_uk_rushorm_android_RushBitmapFile - empty
rush_co_uk_rushorm_android_RushJSONFile - empty
rush_co_uk_rushorm_android_RushTextFile - empty
rush_com_mc_miband1_model2_Weight - empty (haven't ever recorded any weight entries)
```
