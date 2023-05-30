---
title: "Projects"
description: Here are some of the projects that I am working on
featured_image: ""
type: page
menu: main
date: 2022-12-25T15:57:20-08:00
draft: false
---

## Code Projects

### Newsbot

`Newsbot` is my passion project to create your own personal news feed.  This build around letting people run their own instance.  Don't let other services monitor what you pay attention to.

- [newsbot.portal](https://github.com/jtom38/newsbot.portal)
  - This is the web interface to `Newsbot`.  
  - Built with Go.
- [newsbot.collector.api](https://github.com/jtom38/newsbot.collector.api)
  - This API collects the news found on the internet

### dvb (Docker Volume Backup)

[repo](https://github.com/jtom38/dvb)

This tool was made to backup my docker data given I didn't want to chain a bunch of bash commands together.  

### cloudflare-ddns

[repo](https://github.com/jtom38/cloudflare-ddns)

This is a small tool made to run out of one of your servers and will watch for any external IP address changes.  When your records start to drift, the tool will update the DNS records hosted in Cloudflare to match the IP address pulled.
