---
title: "Hosting Static Sites"
date: 2023-05-28T21:00:00-08:00
draft: false
tags: [azure, hugo, hosting]
---

I have always stayed away from posting anything on the internet.  So when it came to getting some of my sites hosted online, well I have had some pitfalls.  Hopefully some of the issues I have run into, you can avoid going forward.

## History

I am always looking for the next free thing when it comes to my projects.  This has resulted in me hosting things internally only or not at all.  I got my domain so I can start to detach more from the big sites and do things on my own a bit.  But now, I had to figure out how to build a site.

Building the site was not as hard,  [hugo](https://gohugo.io/) did make this site much easier to build.  I am not looking for anything complex and with a bunch of javascript overhead so a static website generator was perfect!  At first, I was able to get something online at least locally and it looked good.  So it was time to deploy it.

## Github

I start with attempting to deploy on [github.io](https://pages.github.com/?(null)).  This comes packed in with the repository and all I needed to do was make a couple of changes to deploy the site.  Got that setup and then the site was available at jtom38.github.io.  Well, that's nice and all but I wanted to get it to route to my domain.  This is when things started to fall apart.

Based on the documentation this process should be nothing more than adding a record into my DNS and then setting up the CNAME record.  Well, it worked somewhat.  One page would work but none of the subpages would load correctly.  I would then put the project down for a while as time was limited.

I started to work on a custom hugo theme [cookbook](https://github.com/jtom38/hugo-cookbook) for my new family cookbook.  I did learn more about the inner workings of Hugo and that was great!  I did get that site running just on [github.io](https://pages.github.com/?(null)) but never made it back to my site (this one).  

## Digital Ocean

Later on, I thought about it and figured I needed to take a look at getting a hosted solution for the sites.  Attempted Digital Ocean due to having something like 5 free static sites per account.  I thought that would be great!  I went through the process of getting started and stopped within one night.  The problem is I use the go.mod file in my hugo projects.  The go.mod file is much better than using a git submodule for hugo.

The problem is Digital Ocean attempts to detect what your project is based on reviewing the repo.  Sure, go for it.  When I attempted to tell it that it was a Hugo project, it would never build correctly.  I would attempt to manually tell it what the project was and then wanted to give me a monthly bill.  No, this is a static website so give me the free stuff!

Needless to say, this never worked out and it was abandoned.

## Azure Static Web Sites

I am now back home after a trip and I wanted to get these sites all hosted in a location that was not just my home network.  I can make a docker image or an Apache server, but I don't have a static IP at home and that was going to be another problem.  I do have a solution for the lack of static IP, but more on that in a later post. :)

At one point in time, I did use an AWS S3 bucket to host a website.  It was fine, it worked I am just not an AWS guy.  I learned Azure first for work and that's where I stayed.  So I got a new Azure subscription setup and I was going to host the site in an Azure Storage Account in a public blob bucket.  Then I remembered that Microsoft has a free tier for Azure Static Web Sites.  I did some digging and figured, why not try it?  The hugo documentation was pushed this way and let me give you my thoughts.

I am now running this site on the Azure service and my initial impressions of Azure Static Web Sites, are good!  I created a new FREE resource and give it access to my repo.  Azure/Github loaded a new CI workflow to deploy to the Azure resource and within 5 minutes, the site was online.  The theme was loaded and the links looked good.  I was happy!

Getting DNS setup was also very simple.  On the left-hand side, go to Custom Domains to get started.  Tell it what the domain would be (example: www.yourdomainhere.com) and copy the URL given and create a new DNS record.  Once the record has been made, go back to Azure and tell it Ok.  It will check the records and enable the traffic.

Overall this was very painless and I am glad this is another thing off my to-do list.  Now back to some of my other projects that I might have been neglecting.
