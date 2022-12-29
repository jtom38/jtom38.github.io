---
title: "dbv Alpha Release"
date: 2022-12-28T21:21:30-08:00
draft: false
tags: [golang, dvb]
---

So, last month one of my Linux servers failed and I was unable to recover the VM. I was lucky that the data cared about stored on a mobile device!  Of my containers, the one running my webdav instance was the one I didnt want to lose any data. With that scare, I wanted to address my backup solution, or lack of. So one thing I wanted to do was build a new tool to backup my docker data.

I had a couple of requirements for this process

- Be able to mount the volumes on the container.
- Tar the data and append a date value of when it was made.
- Be able to start/stop the container.
- Post to Discord so I can monitor the jobs.
- Be able to extend the process later.

This all started as a PowerShell (pwsh) script but started to run into small issues.  I like pwsh for when it can be used.  But when I started to build out my logic things just quickly became very messy.  Overall, I like to organize my code in logical ways.  Pwsh wants you to make modules or you have to dot source files into your script.  This gets very messy, quickly.  I also didn't want to have to install pwsh on all my servers.

So I took a look at rebuilding the process in Go. This was my first attempt at getting Go to interface with a CLI but overall, it works rather well. When working with Docker you are able to adjust the `docker container inspect` command so it can return a subset of data.  I adjusted the statement that I would send and get the block that has the container status. With the data comming in as json, I am able to quickly be able to convert that into Go stucts so I can manipulate the data as needed.

One thing that did come up with using the CLI as my primary interface.  Using a const to hold the main block of my CLI command was great!  I have not used const like values much in other languages but man, Go has really changed my tune about them. 

You might ask yourself, why not use the Docker API?  I didn't want to change anything on the servers and keep the API locked up as is.  So this got me playing with the [script](https://github.com/bitfield/script) package.  I wanted to run some tests to see if I can make Go a scripting language.  For the most part, it can.  My tool just grew.

So, with this alpha release, the tool does some basic things for me. 

- Backup multiple containers
- Move them to my NFS server
- Ensure that I only have so many files on the server
- Send notifications to Discord

Given its a basic tool, it does what I want currently.  I do have some more plans for it though.  

- Run the job as a always on job.
- Setup internal cron triggers.
- Backup data outside of Docker
  - Postgres running on a VM
- Move data to a FTP server. (thanks nas!)
  - Sometimes NFS mounts stop working and I need remount the drives
- Maybe other notification services.
- Setup systemd service

I didnt have plans for this to replace everything backup related.  This it does what it needs to and stays out of the way.

If you want to check out the repo, it can be found [here](https://github.com/jtom38/dvb)!

Thanks for reading!
If you want to leave a comment, go here [Comments (github)](https://github.com/jtom38/jtom38.github.io/issues/3)
