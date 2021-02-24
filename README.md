# [Gourav's Portfolio](https://gourav-khunger.web.app)
This project has been inspired from [this repository](https://github.com/jfk-dev/portfolio).

I **had** published this version of the flutter web app to: https://gourav-khunger.web.app. But now, the flutter version is being replaced by newer version using tailwindcss, which will be published soon!

Here's the demo of how the flutter version looks like:

![flutter portfolio demo](https://raw.githubusercontent.com/GouravKhunger/portfolio/flutter/img/demo.png)

## Getting Started with Flutter
A few resources to get you started if this is your first Flutter project:

* Lab: [Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
* Cookbook: [Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view [online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.

## Using this repository
This repository is an edited version of the one [mentioned above](https://github.com/jfk-dev/portfolio). All credits and thanks goes to @jeroen-meijer. If you wish to make your own portfolio as this, first, be sure that you have latest `beta` version of flutter install To do so, run these commands:

    flutter channel beta
    flutter upgrade
    flutter config --enable-web

After running these commands in your terminal, clone this repository to your local machine, open the terminal in the root folder the cloned repository, then run this command:

    flutter pub get

If you have not activated `webdev`, run this in the terminal:

    flutter packages pub global activate webdev

then run:

    flutter build web

This will make the `build/web` folder, you can then run the `index.html` file :)

By this, you will have understood how to build this project.

To edit it's values, here's the reference:

* To change your profile photo, add yours to `\assets\images\` folder. Then edit the `\lib\ux\app_images.dart` file to link the image into the code.

* Favicons of the webpage can be edited by placing your desired favicon into `\web\` folder with the name `favicon.png`.

* You will find the main texts like `Name`, titles, etc, in the `\lib\app_localisation.dart` file. You can edit it's values as per your need. I have removed the multilanguage functionality from the original repository, since I did not need it. If you wish to add it again, please update this same file, getting reference from the original repository.

* To edit the highlights section, that is the most important part of the project, you can look into the `\lib\ux\sections\welcome\highlights_list.dart` file. It contains the boxed layouts that you can add your data into.

* The `\lib\ux\ux_models.dart` contains the data for which social buttons like GitHub profile, Email button, Youtube, Twitch, etc. to be shown, edit it as per your needs. Have a look at `\lib\ux\app_icons.dart` file to get the details of available inbuilt icons that you can use.

These were the most basic things you would need to edit. Anyways, you are free to play around with the project, and come up with your own unique ideas. Happy Coding :)
