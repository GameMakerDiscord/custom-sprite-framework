<h1 align="center">Braffolk's Image Loader</h1>

<h3 align="center">Written by Braffolk#1160</h3>
<h3 align="center">https://marketplace.yoyogames.com/assets/4543/custom-sprite-framework</h3>
<h3 align="center"><a href="https://github.com/GameMakerDiscord/custom-sprite-framework/wiki">Documentation</a></h3>



&nbsp;

Game Maker creates an extra texture page for every sprite and subimage that the user loads into their game using the function sprite_add, this often results in terrible performance issues due to hundreds or sometimes even thousands of texture swaps. This collection of scripts is meant to fix this problem by giving full control over custom texture pages, groups and memory management.

<h3 align="center">Features</h3>

* Now supports bounding box generation and modification.
* Custom texture groups for easier organisation and memory management.
* Supports adding sprites from sheets, subimage files, strips and the internet.
* Easy texture page creation via an algorithm that places everything neatly on the texturepage, you simply have to specify * what to load.
* Now supports bounding box generation and modification.
* Supports adding sprites from sheets, subimage files, strips and the internet.
* Custom texture groups for easier organisation and memory management.
* Easy texture page creation via an algorithm that does everything, you simply have to specify what to load.
* Image caches for storing, faster loading and sending texture groups via networking.
* Functions that can be used the same as the GM sprite functions.
* All GM built in sprite system drawing functionalities and more.
* Support for async loading.


<h3 align="center">Issues & Limitations</h3>

This is optimised for YYC and will be pretty much as fast as built in sprite functionality, however, on the regular windows export it will be still be way faster than sprites that were imported using sprite_add but will be a bit slower than built in sprites. The extension only uses GML. The images refer to texture pages that are stored in backgrounds. As expected, backgrounds & sprites added with background_add or sprite_add take up around two times more memory than a built-in ones would, hence custom texture pages too take more memory than built-in ones.

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/JujuAdams/custom-sprite-framework/master/preview.png" style="display:block; margin:auto; width:300px"></p>


