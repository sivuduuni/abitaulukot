# Abitaulukot

Abitaulukot is a Cordova/PhoneGap wrap for (help files)[https://github.com/digabi/koe-ohje] published by Matriculation Examination Board of Finland. This repository contains files needed to build the app in (Adobe PhoneGap)[https://build.phonegap.com/] build environment. Since the app is been built with free plan the PhoneGap reads files from this repo (`github.com/sivuduuni/abitaulukot`). Therefore the `config.xml` contains IDs specific for our Google Play/Apple App Store account.

## Build Process

 1. Run `make update-cheat` to get the latest version of MEB help files to `koe-ohje/`
 1. Run `make app` to update the version to `app/www/`. PhoneGap builds the app from this directory.
 1. Push the update to your GitHub repo.
 1. Update the source and rebuild in Adobe PhoneGap.

## Icons

The application icon file is stored at `icon/institution.svg`. This file used to generate different versions needed by the app stores by saying
`make icons`. Splash icons (`icon/app-splash-ios-*.png`) are created by hand.

## PhoneGap Notes

### Android Certificate

 1. Allow Google Play to manage your keys.
 1. Download the key from Google Play. You get a `deployment_cert.der` file.
 1. To make things easier use same password for all certs.
 1. Create keystore (it is OK to accept "Unknown" for all questions):
    `keytool -genkey -v -keystore abitaulukot_android.keystore -alias google_play -keyalg RSA -keysize 2048 -validity 10000`
 1. Convert `abitaulukot_android.keystore` to standard format as suggested by `keytool`: [FIXME: Not needed]
    `keytool -importkeystore -srckeystore abitaulukot_android.keystore -destkeystore abitaulukot_android.keystore -deststoretype pkcs12`
 1. Import .der to your keystore:
    `keytool -import -keystore abitaulukot_android.keystore -alias abitaulukot_android -file deployment_cert.der`
 1. Add password to the imported certificate `abitaulukot_android` (PhoneGap requires this). I suggest using the same password here.
    `keytool -keypasswd -keystore abitaulukot_android.keystore -alias abitaulukot_android`
       keytool -keypasswd -new NewCertPass -keystore keystore.jks -storepass KeystorePass -alias mydomain -keypass OldCertPass
 1. Upload your `abitaulukot_android.keystore` to PhoneGap. "title" is a free-form string while "alias" is the alias of your
    deployment certificate ("abitaulukot_android" in the above example).

## Acknowledgements and Licenses

 * Content: MEB help files (MIT), contains FontAwesome (MIT)
 * Abitaulukot app icon: Paomedia institution-icon (Public Domain), (source)[https://github.com/paomedia/small-n-flat]
 * Abitaulukot itself: MIT
 * Abitti is trademark of Matriculation Examination Board
