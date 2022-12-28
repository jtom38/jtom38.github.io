---
title: "2023 Goals"
date: 2022-12-27T18:11:30-08:00
draft: false
---

As we roll into 2023 I have some new goals that I am working on.

## 1. Start Blogging

One of the things I have seen is people talk about learning in public.  This is something I have not done too much right now.  Sure you can find my GitHub profile and see what I am up to, but it doesn't have a roadmap per-say.  So, time to start working on it.  You can find my thoughts here on my site.  Who knows if I am going to cross-post to other services?

## 2. Learn about OAuth

Authentication has always been a stopping point for me.  I want to bring services out but always stop for one reason or another.  Right now one of the blockers for newsbot is authentication.  
I have looked at Auth0, and it looks nice for sure, but I am not in a position to spend money on much.  As my portal project continues to grow, I want to have others test it and give me some data, but the app does not have any authentication at this time, so it will not be public on the web.
For Go, I am taking a look at [goth](https://github.com/markbates/goth) to provide some of the authentication services.  But as I work through this I suspect that I will need to create a new API to handle authentication between the API and Portal.  The reason for another API is to avoid multiple services on a single API.  The collector does one thing, collect.

As is, the notification service that is in the collector should be migrated away from that API, but that's something I am not ready to work on, yet.

## 3. Event-Driven Architecture

So I understand this as a theory at and high level, but I have not worked on this yet.  As my day job is DevOps, I don't get much of a chance to work on building Event-driven services.  So, Newsbot will be the starting point for me.  Newsbot will have other features added to it and as it grows I think adding Events will help keep all the services informed.  This can also be used for queuing up requests from the portal.  

I have done a little work with RabbitMQ but looking at the documentation on [NATS](https://nats.io/) and this looks easy to interface with.  Right now I have been working with Azure Storage Queues and they work well, but I don't want to force anyone to use Azure.   NATS looks promising so hopefully, I will have some news about how things are progressing.

## 4. WebAssembly

I have been watching how WASM is improving and how people are making use of it.  I find this all very interesting and want to get in on it.  I am not a huge fan of Javascript, and with that, I am looking at building apps with minimal js and mostly using MVC as my primary pattern.  But replace all the JS code with the Go code.  Make my web development life easier (hopefully) and be able to share my findings with everyone too.

These are some of the topics that I hope to be able to dig into in the new year.  Only time will tell how far I can make it.

Thanks for reading!

## Links

- [goth](https://github.com/markbates/goth)
- [NATS](https://nats.io/)
- [WebAssembly]()