# Abitaulukot

Abitaulukot is a Cordova/PhoneGap wrap for (help files)[https://github.com/digabi/koe-ohje] published by Matriculation Examination Board of Finland. This repository contains files needed to build the app in (Adobe PhoneGap)[https://build.phonegap.com/] build environment. Since the app is been built with free plan the PhoneGap reads files from this repo (`github.com/sivuduuni/abitaulukot`). Therefore the `config.xml` contains IDs specific for our Google Play/Apple App Store account.

## Build Process

 1. Run `make update-cheat` to get the latest version of MEB help files to `koe-ohje/`
 1. Run `make app` to update the version to `app/www/`. PhoneGap builds the app from this directory.
 1. Edit `app/config.xml`: Increase `versionCode` by one and edit `version` according to your version numbering principles.
 1. Push the update to your GitHub repo.
 1. Update the source and rebuild in Adobe PhoneGap.

## Icons

The application icon file is stored at `icon/institution.svg`. This file used to generate different versions needed by the app stores by saying
`make icons`. Splash icons (`icon/app-splash-ios-*.png`) are created by hand.

## PhoneGap Notes

### Android Certificate

 1. Allow Google Play to manage your keys.
 1. To make things easier use same password for creating keystore and certificate.
 1. Create keystore (it is OK to accept "Unknown" for all questions):
    `keytool -genkey -v -keystore abitaulukot_android.keystore -alias abitaulukot_android -keyalg RSA -keysize 2048 -validity 10000`
 1. Upload your `abitaulukot_android.keystore` to PhoneGap. "title" is a free-form string while "alias" is the alias of your
    deployment certificate ("abitaulukot_android" in the above example).

### Apple Appstore Stuff

 1. Get a App ID for your application: [https://developer.apple.com/account/ios/identifier/bundle] (Identifiers > Abitaulukot).
    You need this code to `ios-CFBundleIdentifier` located in `app/config.xml`
 1. Add distribution profile: [https://developer.apple.com/account/ios/profile/production] (Provisioning Profiles > Distribution).
    * Development: iOS App Development
    * Distribution: App Store
    * Select the App ID and distributor (you)
    * Enter profile name. This is for you only.
    * Download the provisioning file (e.g. `Abitaulukot.mobileprovision`). You need this later.
 1. Download the distributor iOS Certificate: [https://developer.apple.com/account/ios/certificate/distribution] (Certificates > Production):
    `ios_distribution.cer`. For more information on working with distrubutor certificate on Linux see
    [https://patrickshuff.com/generatingsigning-ios-development-keys-on-linux-with-phonegap-build.html]
 1. Give your certificates (provisioning and distributor) to PhoneGap.

## Acknowledgements and Licenses

 * Content: MEB help files (MIT), contains FontAwesome (MIT)
 * Abitaulukot app icon: Paomedia institution-icon (Public Domain), (source)[https://github.com/paomedia/small-n-flat]
 * Abitaulukot itself: MIT
 * Abitti is trademark of Matriculation Examination Board
