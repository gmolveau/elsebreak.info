+++
author = "Christophe DOUY"
title = "Android Dev - System UI has stopped working"
description = "Android Dev - System UI has stopped working"
tags = [
    "android",
    "system-ui"
]
date = "2015-11-13"
menu = "main"
+++

Alright, my first post will be about something that took me way too much time to fix. Find a TLDR version at the end of it. 

For about a month or so I've been working on an Android/REST project. Working with people that were new to Android, I had a great pleasure letting them doing things that bores me, like XML layouts, and basic design - including creating background images, and a logo.
Time to time, I had to merge their branches on develop, everything was fine, work was being done.  

Until that one time.

For those that are new to Android development, you have to know one thing. It requires an Android device. If you don't have a physical one, well, I'm sure your favorite IDE will allow you to create an AVD - Android Virtual Device. However, your processor architecture wasn't made for Android, so the AVD has to do some overwork to be able to emulate an Android Device, which translates in an AVD taking forever to start, and being terribly slow. Although Intel did some nice stuff a few years ago by releasing the SDK Tool "Intel x86 Emulator Accelerator", which ... accelerates your emulator, it still lacks a decent fluidity.
Soooo, basically, you end up using your phone.

Back to the story. There was this branch I had to merge, with new backgrounds, and a way better looking logo than the previous one. My friend ran it on its phone, great, I just needed to finish some stuff, and then I could merge everything. Got back home, merged my branch with develop, did some tests, worked fine. Switched to the last branch, merged it, fixed some conflicts, and ran it on my phone. Wow, the app was great. Then I tried to close it.

**"Unfortunately, System UI has stopped working".**

*Yeah what do you mean ?*

**"Unfortunately, System UI has stopped working".**

*God, I can't close this alert, it keeps coming back. I'll shut my phone.*

***Phone reboots***

**"Unfortunately, System UI has stopped working".**

*Oh god that feels wrong.*

The almighty Internet only had 2 solutions. Wipe partition cache, meaning cleaning the applications cache data, and not really losing anything important. Of course, it didn't worked.
I was left with resetting to factory settings.

So yeah, I merged a branch, got sure code was fine, and lost all my data in 5 minutes. 
And now, I had to figure out why, and how to fix it. I launched my application in an old AVD. The app started, I clicked the home button, and the System UI crash happened. Following was the Error logged in the Android Monitor :
```language-java
11-12 01:51:22.335 2821-2836/com.android.systemui E/WVMExtractor: Failed to open libwvm.so: dlopen failed: library "libwvm.so" not found
11-12 01:51:22.623 2821-2821/com.android.systemui E/AndroidRuntime: FATAL EXCEPTION: main
11-12 01:51:22.623 2821-2821/com.android.systemui E/AndroidRuntime: Process: com.android.systemui, PID: 2821
```
Wow. Lacking a lib used by the systemui ? That sounds pretty bad. I tried creating a new AVD, with the latest Android API plus Google API and 1.5Gb of Ram. Same thing happened.
I tried back develop's previous version. No crash. I read a bunch of articles about this issue, nothing really related. Dangit, I'd have to take a look again at all the code.
Read it all. Nothing weird.

Great, what next. I could try to apply changes file by file, smallest feature at a time, and test the application. But it could take way too much time, and every time the AVD crashes, I'd need to restart it all, or the snapshot used by the AVD would just stay stuck on the error like my phone did.

So, guess what piece of code could break your whole application and make your phone crash in the less explicit way. A damn logo. Made on Illustrator, it was a 6MB one. My friend never had the smallest issue with its OnePlus One, but I could reproduce it with both my real Moto G 4G, and my AVD's (a Nexus 4, a Galaxy Nexus and a Nexus 5). It's possible the OnePlus One was able to handle this with its 3 GB of RAM or its Cyanogenmod ROM. 
2 things made me realise it could come from the drawables. First, I was sure the code was right after reading it multiple times. Second, the issue was only happening when I tried to go outside the app. What's both part of an application and out of it ? My only guess was the logo.

I do blame Android for its (really) poor exception/stacktrace, and for not being able to handle this issue AT ALL on these devices. Losing its data because of a logo is quite a frustrating experience.
 
So yeah, TLDR : Check your drawables size. A drawable too heavy *may* crash your device with nothing but nonsense in the Android Monitor.