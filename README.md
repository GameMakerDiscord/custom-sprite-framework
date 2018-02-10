<h1 align="center">Braffolk's Image Loader</h1>

<h3 align="center">Written by Braffolk#1160</h3>

Game Maker creates an extra texture page for every sprite and subimage that the user loads into their game using the function sprite_add, this often results in terrible performance issues due to hundreds or sometimes even thousands of texture swaps. This collection of scripts is meant to fix this problem by giving full control over custom texture pages, groups and memory management.

<h3 align="center">Features</h3>

* Custom texture groups for easier organisation and memory management.
* Easy texture page creation via an algorithm that does everything, you simply have to specify what to load.
* Image caches for storing, faster loading and sending texture groups via networking.
* Functions that can be used exactly the same as the GM sprite functions, except the collision specific functions.
* All GM built in sprite system drawing functionalities and more.

<h3 align="center">Issues & Limitations</h3>

This is optimised for YYC and will be pretty much as fast as built in sprite functionality, however, on the regular windows export it will be still be way faster than sprites that were imported using sprite_add but will be a bit slower than built in sprites.

<p align="center"><img src="https://raw.githubusercontent.com/JujuAdams/custom-sprite-framework/master/preview.png" style="display:block; margin:auto; width:300px"></p>
