# You need libclosure-compiler-java package

update-cheat:
	if [ ! -d koe-ohje ]; then git clone https://github.com/digabi/koe-ohje.git; cd ..; fi
	cd koe-ohje; git pull

cheat-root:
	cp koe-ohje/index.html app/www/index-cheat.html

cheat-common:
	# Copy everything from cheat common to app except videos
	rm -fR app/www/common/
	mkdir -p app/www/common/

	cp koe-ohje/common/clipboard.min.js app/www/common/

	cp -r koe-ohje/common/css/ koe-ohje/common/fonts/ koe-ohje/common/images/ \
		koe-ohje/common/js/ koe-ohje/common/mathjax/ koe-ohje/common/tablesorter/ \
		app/www/common/

	# Replace non-american characters in filenames (PhoneGap dislikes them)
	mv app/www/common/images/math/suorakulmainen-särmiö.png app/www/common/images/math/suorakulmainen-sarmio.png
	mv app/www/common/images/math/suorakulmaisen-särmiön-tilavuus.png app/www/common/images/math/suorakulmaisen-sarmion-tilavuus.png

cheat-build:
	# Copy everything from cheat build to app except Abitti tab
	rm -fR app/www/build/
	mkdir -p app/www/build/

	cp -r koe-ohje/build/ app/www/

replace-tab-abitti:
	# Make changes to build/tab-abitti.html

	# Remove video tags
	sed -i -e 's/<video.*><\/video>/<p class="fi">\[Videot on poistettu Abitaulukoista tallennustilan säästämiseksi.\]<\/p><p class="sv">\[Videor har tagits bort från Abitaulukot för att spara lagringsutrymme.\]<\/p>/g' app/www/build/tab-abitti.html

replace-tabs: replace-tab-abitti

abitaulukot-additions: abitaulukot-additions/*
	# Copy Abitaulukot additions on the top of the app
	cp -r abitaulukot-additions/* app/

app: cheat-build cheat-common cheat-root replace-tabs abitaulukot-additions
	if [ ! -d app/www ]; then mkdir -p app/www; fi

icons-android: icon/institution.svg
	# Android app icons
	# Android icons have transparent background
	./convert_icon_bg-transp.sh icon/institution.svg app/www/app-icon-android-32.png 32
	./convert_icon_bg-transp.sh icon/institution.svg app/www/app-icon-android-64.png 64
	./convert_icon_bg-transp.sh icon/institution.svg app/www/app-icon-android-128.png 128
	./convert_icon_bg-transp.sh icon/institution.svg app/www/app-icon-android-512.png 512

icons-ios: icon/institution.svg
	# iOS app icons
	# iOS icons have white background
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-1024.png 1024
	cp app/www/app-icon-ios-114.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon@1x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-114.png 114
	cp app/www/app-icon-ios-114.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon@2x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-80.png 80
	cp app/www/app-icon-ios-80.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-40@2x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-40.png 40
	cp app/www/app-icon-ios-40.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-40.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-100.png 100
	cp app/www/app-icon-ios-100.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-50@2x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-50.png 50
	cp app/www/app-icon-ios-50.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-50.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-120.png 120
	cp app/www/app-icon-ios-120.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-60@2x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-180.png 180
	cp app/www/app-icon-ios-180.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-60@3x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-144.png 144
	cp app/www/app-icon-ios-144.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-72@2x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-72.png 72
	cp app/www/app-icon-ios-72.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-72.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-152.png 152
	cp app/www/app-icon-ios-152.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-76@2x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-76.png 76
	cp app/www/app-icon-ios-76.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-76.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-167.png 167
	cp app/www/app-icon-ios-167.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-83.5@2x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-57.png 57
	cp app/www/app-icon-ios-57.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-58.png 58
	cp app/www/app-icon-ios-58.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-small@2x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-87.png 87
	cp app/www/app-icon-ios-87.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-small@3x.png
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-29.png 29
	cp app/www/app-icon-ios-29.png app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/icon-small.png

	# iOS app launch images
	# These are originally made by hand, we copy them to the final location
	cp icon/app-splash-ios-640x960.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default@2x~iphone.png
	cp icon/app-splash-ios-640x1136.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default-568h@2x~iphone.png
	cp icon/app-splash-ios-750x1334.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default-667h.png
	cp icon/app-splash-ios-1242x2208.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default-736h.png
	cp icon/app-splash-ios-320x480.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default~iphone.png
	cp icon/app-splash-ios-2048x1536.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default-Landscape@2x~ipad.png
	cp icon/app-splash-ios-2208x1242.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default-Landscape-736h.png
	cp icon/app-splash-ios-1024x768.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default-Landscape~ipad.png
	cp icon/app-splash-ios-1536x2048.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default-Portrait@2x~ipad.png
	cp icon/app-splash-ios-768x1024.png app/platforms/ios/Abitaulukot/Images.xcassets/LaunchImage.launchimage/Default-Portrait~ipad.png

	cp icon/app-splash-ios-* app/www/

	# These icons are created but not found in the app/platforms/ios/Abitaulukot/Images.xcassets/AppIcon.appiconset/
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-60.png 60
	./convert_icon_bg-white.sh icon/institution.svg app/www/app-icon-ios-512.png 512

icons: icons-android icons-ios
