---
title: "Unraid Upgrade"
date: 2023-06-18T00:00:00-08:00
draft: false
tags: [on-prem, docker, hosting, unraid]
---

- [Install Process](#install-process)
- [Setting up the array](#setting-up-the-array)
- [Cache Disks](#cache-disks)
- [Docker Applications](#docker-applications)
- [Cost](#cost)
- [Closing thoughts](#closing-thoughts)
- [Links](#links)

Last month I brought up some of my self-hosting journeys.  With that, I did say that I was going to be moving over to [Unraid](https://www.unraid.com/).  My first server has been upgraded and most of my services have been moved.  So let's talk about Unraid.

## Install Process

One thing I did like about Unraid was it runs from a USB flash drive.  This is great because ProxMox ran from my hard drive and thus needed a partition just to run the operating system.  By using the flash drive, I can allocate both of my drives to just data storage.

The first flash drive that I attempted did not work.  Unraid checks the serial number of the drive to make sure it's valid.  This is used for the licensing process from my understanding.  No worries, it was one of my oldest flash drives so I was trying to give it another job.  I switched over to a newer drive, flashed the image, and Unraid booted right up.

Yet again because the software does not get installed on the internal drives, you will need to make sure your BIOS is configured to always boot the USB.  So I removed all the other boot options from the server and just have the USB as the only option.  I did have to enable UEFI to make that work, but no problems for Unraid.

## Setting up the array

Once the server is online, you can connect to it with a web browser and start getting it configured.  At this point, I went and configured my drives. (2 8TB disk) One of them is parity and the other is a data disk.  One thing to note, make sure you buy at least one large disk.  Once the array is set up, you can only install drives up to the largest in the array.  So for me, I can only go up to 8TB disks.  As this server might get another disk later on, I am good with 8TB usable for an application server.

Once the array started to build it took about 10 hours to complete.  I suspect this would be much faster with SSD but I am not going to be throwing that much money at this project.  As the array is building you might be able to start playing with the server but I would just say let it finish building the array to avoid any issues.

I might get an SSD to use as a cache disk to offload read-write to the drives.

## Cache Disks

Unraid supports a cache disk.  From my understanding, this would be the device that would take the initial changes of data to avoid extra writes to the spinning disks (HDD).  I don't have one yet, but it is something I am thinking about for a later time.  One of the reasons why is I did notice the drives would heat up with usage.  The Parity drive heats the most as it's trying to sync all the data changes.

Adding a cache disk would take the brunt of all the disk changes and then unraid would take the changes and write them back to disk.  As I don't have one yet, I am unsure if this feature only works against the network shares or if I can use it with my Docker applications.  If I can get it to work with the docker applications then I think it would remove some stress from my disks and make it worth the money.

## Docker Applications

One of the big reasons why I went with Unraid over [TrueNAS](https://truenas.com/) was because Unraid uses Docker.  TrueNAS uses BSD jails and honestly, I did not want to go learn jails or figure out how to get my applications to work in a jails container.  Docker has made bundling applications so much easier that I did not see the value add in going over to BSD Jails.

Installing a docker application is very simple.  The Unraid community has templates to help bootstrap the container deployment and I was able to get most of my applications moved over within the first day of operation.  Yet again, I suspect it would take longer to get up and running in Jails, but I don't have experience with that.

I have some applications that I have built and they have also been very easy to migrate over.  I have been running into some permissions errors trying to write to some config files, but I think that's more Linux permissions and I can figure some of that out by looking at some of the community templates.

## Cost

Unraid is not free.  So with that, I know most people will just not look at this.  But as someone who has been playing with Linux and also does his fair share of system administration, it's worth the money.  

- Upto 6 disks = $59
- Upto 12 disks = $89
- Unlimited disks = $129

This is a one-time purchase per system and if you want to bump up to a higher tier for more disks, you just pay the difference from my understanding.  There is no tier system like you might have seen with Microsoft products.  The only difference is the number of disks you can run.  All the services are available that everyone has.

At the time of writing this, I am still using the trial instance and it's been rock solid.  My device has not needed to be rebooted once things have been set up.

## Closing thoughts

My overall feelings right now are very positive to the point I am going to work on getting another Unraid setup going.  This will be smaller in context and will run some of the internal services.  I will use something like [Synthing](https://syncthing.net/) to keep the data synced between nodes and then I can also plan on an external node for external backup.  But that will take some more time.

## Links

- [Unraid](https://www.unraid.com/)
- [TrueNAS](https://www.truenas.com/)
- [Synthing](https://syncthing.net/)
