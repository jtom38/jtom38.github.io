---
title: "Projects"
description: Here are some of the projects that I am working on
featured_image: ""
type: page
menu: main
date: 2022-12-25T15:57:20-08:00
draft: false
---

## Newsbot

I am building Newsbot in a time where more news is just aggregated on a couple of sites.  I don't want social media to know what I am reading so they can make more money off me and send me more ads.  This will collect news from the defined sources (RSS/Atom, Youtube, Github).  If defined it will repost what it collects to Discord with webhooks.

### Portal

[Git](https://git.jamestombleson.com/jtom38/Newsbot.Portal)  
[Docker Hub](https://hub.docker.com/r/jtom38/newsbot-portal)

Status: `Unstable`  
Language: `C#`

This project is built in `dotnet 7` running Blazor Server.  The first version of this project started in Go but is getting rebuilt as I focus on C#.

### Collector

[Git](https://git.jamestombleson.com/jtom38/Newsbot.Collector)  
[Docker Hub](https://hub.docker.com/r/jtom38/newsbot-collector)

Status: `Stable`  
Language: `C#`

The collector is the API that runs Newsbot.  This will reach out and collect the new posts from sites with RSS/atom feeds, Youtube, and Github.  Reddit and Twitch support will be added back later on.

## dvb (Docker Volume Backup)

[Git](https://github.com/jtom38/dvb)

Status: `Alpha`  
Language: `Go`

This tool was made to backup my docker data given I didn't want to chain a bunch of bash commands together.  

## cloudflare-ddns

[Git](https://git.jamestombleson.com/jtom38/cloudflare-ddns)  
[Docker Hub](https://hub.docker.com/r/jtom38/cloudflare-ddns)

Status: `Alpha`  
Language: `Go`

This is a small tool made to run out of one of your servers and will watch for any external IP address changes.  When your records start to drift, the tool will update the DNS records hosted in Cloudflare to match the IP address pulled.
