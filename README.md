# Abitaulukot

Abitaulukot is a Cordova/PhoneGap wrap for (help files)[https://github.com/digabi/koe-ohje] published by Matriculation Examination Board of Finland. This repository contains files needed to build the app in (Adobe PhoneGap)[https://build.phonegap.com/] build environment. Since the app is been built with free plan the `config.xml` contains IDs specific for our Google Play/Apple App Store account.

## Build Process

 1. Run `make update` to get the latest version of MEB help files to `www/`
 2. Push the update to your GitHub repo.
 3. Start build in Adobe PhoneGap.

## Icon

The application icon file is stored at `elements/app-icon.svg`. This file used to generate different versions needed by the app stores.

 1. FIXME: Howto generate all icon size versions

## Acknowledgements and Licenses

 * Content: MEB help files (MIT), contains FontAwesome (MIT)
 * Abitaulukot app icon: Paomedia institution-icon (Public Domain), (source)[https://github.com/paomedia/small-n-flat]
 * Abitaulukot itself: MIT
 * Abitti is trademark of Matriculation Examination Board
