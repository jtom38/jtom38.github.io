---
title: "Is it time to Go?"
date: 2023-02-25T21:13:30-08:00
draft: false
tags: [golang, dvb]
---

I will have been working with go for a year next month. This last year I have learned so much about the language and come to love how simple and flexible it is. I see a great future for it within the web ecosystem. It's very easy to build up a new web service in go that will work on any system. My problem with it is more around the lack of companies using it.

I got my start in the software world learning C# (8 years ago or so).  That worked very well for me as I was able to find a job working on some C# automation. This was a great learning opportunity that gave me some professional experience.  Now my background is more in infrastructure so this has hampered my ability to move over to software full-time.  

My team at work has been using Go to build our first automation API and some CLI tools.  This has been a blast to work on and build up but we ran into some issues.  We use Azure for our Cloud solution and we ran into issues with the public packages of the ones we could find.  Microsoft does not have great support for Go right now.  As the language ages maybe support will improve.  But this resulted in us writing a bunch of API packages to interface with Azure.  As fun as this is, it's a bunch of boilerplate code and also slows down our delivery.  Plus if Microsoft deprecates a feature and the package does not support it, we have to roll our own or hope our PR gets approved upstream.  With some of the packages, we found that some have gone stale with no updates in a year or more.

Our other development teams already write .NET and given the tools we use, I chose to move our development focus over to .NET.  It makes me sad to do that but I wanted to make sure others can use the tools we make rather than have them thrown away given no one else writes Go.

With that change at work, I am also going to shift my focus back to C# for my projects.  I already know how to use it so it's not that big of a shift.  The tools like DVB will stay with Go, but Newsbot will be rewritten in C# to help my learning and add it to the portfolio.

I am sad to be changing my focus but as it is I am thinking about learning Rust next year.  Who knows what the future holds but I have always worked with Microsoft products at work and open source at home.  I am looking to always learning and continuing forward!
