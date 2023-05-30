---
title: "Self-Hosting Services"
date: 2023-05-30T00:00:00-08:00
draft: false
tags: [on-prem, docker, hosting, kubernets, unraid]
---

I have always been running something out of the house.  This started with just Plex and it's slowly grown as I have grown as a developer and run my apps in the house.  It can be a fun hobby, but man when something breaks it might be staying broken for a bit.

This year I am going to be performing some home upgrades to some of my servers.  When I say servers, I just mean older desktops.  I have been running services on three desktops running various services for myself.  I have hit the limit of what I can do with the hardware given I am lacking drives and RAM.

For the last three years, I have been trying out new things to learn and at this point, I am going to share my thoughts on things.  Before this point in time, I just had a single computer, running Windows and [Plex](https://www.plex.tv).  Nothing super fancy, oh, and maybe a Minecraft server once in a while.  But the scope was about to change.

## Kubernets (k8s)

Kubernetes, the new hot thing on the market, was like 5 years ago.  It's fantastic if you need to be able to scale out and not worry about vendor lock-in.  You can do some very impressive things with it and people have write-ups all over the place on this.  Let's take a look at it in the context of on-prem deployments and some of the struggles I ran into.

Installing Kubernetes was a small trial on its own.  I think I used an Ansible playbook to build the initial cluster.  I think it uses kubeadm at the core and overall, this worked.  Getting one node to be the master and the others as agents, did have its issues.  Based on your requirements you can run everything on one agent but that's not recommended.  At a minimum, you would want to have three agents.

So I picked up two other desktops and installed [Proxmox](https://www.proxmox.com/en/) and set up two bigger VM's.  This worked but the can of worms was just getting opened.

Networking in Kubernetes makes assumptions that you are running in the cloud.  If you are not the default configuration would just never work.  The solution I found was to use [MetalLB](https://metallb.org/) to expose IPs to the pods.  This did work once the initial configuration was done.  Basic pods got on the network and I was able to talk to them.

Data storage was another fun one.  Yet again Kubernetes makes assumptions you are running in the cloud.  So you want to run on-prem?  Try an NFS mount into the container.  This did work for most applications.  But did your application make use of SQLite?  Oh, you are in for a rough time.  SQLite does not play well over NFS due to how the database locks are set up [SQLite and NFS](https://www.sqlite.org/faq.html#q5).  This would then show up in the application as random lockups as the lock was removed and relocked.  Needless to say, you should move to a full database like [Postgres](https://www.postgresql.org/), but not all applications would support this.

So I would then have to host the application via a local binding to make sure the database would not lock up.  So because of this, I threw out the big advantage of Kubernetes, high availability.  So, that stinks but things are working so that's good, I guess.

My goal was to use NFS so I would have much more data storage available to each pod, but with that dream dead, several of my applications started to eat into the agent's disk space.  The agents are made to be thin so what's the difference between this and just running [Docker](https://www.docker.com/)?  Not much at this point.  

One thing I did take a look at to avoid using the local binding was [Ceph](https://ceph.com/en/) to create distributed storage pools that K8S would be able to connect to.  Yet again this required rescaling my VM's with what little disk space I had per desktop and attempting to get the Ceph agents to talk to each other.  I did not continue forward with this due to my hardware constraints.  This might be better if you have the space for it but not for my needs.

I did take a look at getting ISCSI working but my NAS did not support it.  I would have needed to make another VM just to handle ISCSI and then drop that into an NFS mount to my NAS.  Overall, sounds like jank so I did not move forward with this.

Because of the local disk space problems, I would need to rebuild agents and join them in the cluster.  Now I had a new issue, I was not able to get the master node to give up the binding to the old agent.  This resulted in a zombie agent that I could not get rid of.  I would just leave it because it didn't break anything, but just was annoying to look at.

I did not perform any k8s updates to the cluster because of the disk space problems and the zombie agents.  This just started to fall apart more and more.  If I had provisioned each agent with 16 GB of ram and 512 GB of drive space I might be ok, but these are old desktops, I don't have that kind of hardware available.  Dont, mind that some of the pods would enter reboot loops or throw new issues that I would not be able to recover from.  The amount of work to keep k8s happy was not worth the squeeze anymore.  Time to go back to Docker and start getting some of my time back from this nightmare.

Overall, Kubernetes is great but make sure you have the hardware to support it.  When I look at the numbers in Azure too, it's expensive to run for something that will require a fair amount of time to make sure it's happy.  If you don't need Kubernetes and just running small containers, then don't.  Save yourself the costs and headaches just use Docker/podmon.

`Note: Things could have improved so the notes given here are taken in the point in time of 2020/2021 and my personal experience.`

## Back to Docker

Now that Kubernetes was dead to me in my home, I start to just deploy my containers back to docker and man things got much easier to maintain.  I started to convert my k8s deployments over to [docker compose](https://docs.docker.com/compose/) yaml files and stored them in a git repo.  Each project had a man file that I could use to make some tasks easier per app/project.

Overall, I did make some good progress but disk space was always a problem.  Because I was running VMs inside Proxmox I always had a provision for a chunk of disk space per VM.  This made moving things around harder and expanding the disks per VM has been a small problem.  I did lose a VM trying to expand the guest disks.  

At this point, the services did start to run much smoother for me and I started to get more time back so I could go back to working on code projects.  I did add some new services like a webdav instance to break away from Google Drive and put that back on my hardware.  This has been nice to have and I would say make a webdav instance.  It's simple and to the point on what it will do.  I did try bigger services like [NextCloud](https://nextcloud.com/) but it's PHP driven and never got things to work just right and I heard nothing but pain about migrations so I did a hard pass.

One thing I miss was the deployment process of deploying changes to Kubernetes.  Docker lacks this and it's just an on-prem problem.  I know [Dokku](https://dokku.com/) exists to make on-prem feel like Hiroku but I have not been ready to make that plunge.

I want something like [ArgoCD](https://argo-cd.readthedocs.io/) for Docker, but to my knowledge, this does not exist.  I have my thoughts on how something like this could be made and even maybe over multiple Docker hosts.  But, this would not be an easy problem to solve and is it even worth it?

## Unraid

Jump forward to April 2023, I am looking to expand my servers but knowing that I would be running [JBOD](https://www.techradar.com/features/what-is-raid-and-jbod) on desktop class hardware did not sound like a great idea.  I needed a way to have some raid but also make the server management easier.  I don't want to be in the business of maintaining servers at work and home after all.

I have known about [Unraid](https://unraid.net/) for a while now but it's never been something I wanted to dip my toes into.  But now that my servers are less complex and Unraid has Docker support, honestly, this might work as a cheaper replacement for Proxmox.  The reason I had Proxmox was so I had a backdoor into the server if any of the VMs broke.  The last thing I wanted to do was break out a crash cart (monitor and keyboard) to connect to the server to do anything. Proxmox gives has the web UI to manage things.  Unraid has the same.

Unraid also gives me the flexibility to expand the array without much issue.  Attempting to add a new disk in Proxmox would have been a small task on its own, Don't mind that I would have to shift data around to make things work.

I also wanted to get some of my RAM back.  Each VM that is provisioned is a full Linux server so RAM has to be allocated and maintenance needs to be performed on the server.  I want to focus on my software, not being a systems administrator so anything to get away from this is a big plus.

I know [TrueNAS](https://www.truenas.com/) is a competing product to Unraid, but at the end of the day, my time is money.  TrueNAS might be fantastic, but I am sick of messing around with Linux I just want things to work.  Spending some money on Unraid is a drop in the bucket for my long-term sanity as long as things work.  For some, saving money is more important but at this point in my life, I have other things to do other than worry about my servers.  When something goes offline it's offline for weeks before I can get back to it.  I don't want that anymore.

I will be starting my trial of Unraid soon and I will report back my thoughts at a later time.
