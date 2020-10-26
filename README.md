# [Gourav's Portfolio](https://gourav-khunger.web.app)
This project has been inspired from flutter channel beta
Please check that out too.

I have published my version of the flutter web app to: https://gourav-khunger.web.app. Check it out if you wish too :)

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
