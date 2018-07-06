+++
author = "Christophe DOUY"
title = "JHipster Conf"
description = "JHipster Conference 2018"
tags = [
    "jhipster"
]
date = "2018-07-06"
menu = "main"
+++

Alright, quite a loooong time since the last blog post. I've made quite a few internal posts at work since then, that I may share in the future, so please look forward for these also !

<h1 style="text-align: center;">
**JHipster Conf**
</h1>
I've been to the JHipster conf 2 weeks ago, and thought I'd take the opportunity to share what I've seen here. 

### 1. First of all, what's JHipster

JHipster is a Yeoman generator, Open Source, allowing to generate, develop and deploy web applications combined from a Spring Boot Backend, and an Angular or React Frontend. It provides a ton of features out of the box, and its ease of use makes it perfect to bootstrap full-features projects. 

Among the many options, we can find : 

- **Monolith** vs **Microservice App**
- **JHipster Registry** : The combination of an Eureka Server (Discovery Service from Netflix OSS) to deal with routing, load balancing & scability, Spring Cloud Config server to manage the applications' configurations, and an Admin Server to manage & monitor the applications. 
- **Angular** vs **React**
- **Caching** support : **EhCache, Hazelcast, Infinispan, Memcached**
- **Authorization** (**JWT** / **OAuth2**)
- **Docker** (Each generated application comes with its docker folder, with the necessary Docker Compose files)

Example of a Microservice Architecture with JHipster's Stack : 
