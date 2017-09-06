+++
author = "Christophe DOUY"
title = "Ionic - Datepicker & Android"
description = "Ionic - Datepicker & Android"
tags = [
    "ionic",
    "android"
]
date = "2016-02-23"
menu = "main"
+++

After struggling a bit on how to implement a nice looking datepicker with Ionic, I thought I'd share some details here. 

After reading a few articles, I was left with two possibilities, using a plugin (there's a bunch of cordova ones) which would add dependencies and require to code a little, or simply using HTML5 `<input type="date" />` which seemed to be nicely supported on most mobile browsers, using the mobile's native ui. So here I am, simply adding my HTML line, and launching my app on a 5.2 Android device.

Oh snap. 
<img src="https://i.stack.imgur.com/nGbEi.png"> 
What happened ? I get the Android 2.x datepicker ui , which is really not what I hoped for. I check that my phone responds well with regular websites' `<input type="date" />`, and it correctly renders the native datepicker. I try to update cordova & ionic, tweak a bit the targetSDKVersion and stuff, but nothing works. 

After googling a bit (a lot...) and ignoring most posts which are a few years old and telling to use a cordova plugin, I finally found a solution : 
https://forum.ionicframework.com/t/building-a-date-picker-in-ionic-input-type-data-we-get-android-2-3-style-datepicker/27477/3

So, **TLDR version**:
Datepicker is not rendering properly on Android ?
>*`mhartington - Ionic Team`*
>
This can be fixed by opening platforms/android/AndroidManifest.xml, and removing this
`android:theme="@android:style/Theme.Black.NoTitleBar"`

As fredericoramos said, I think it should be specified somewhere in the docs. Nonetheless, I find Ionic to be a really great framework (best one I've been using so far for developping web apps), and hope to try out Ionic 2 soon. 