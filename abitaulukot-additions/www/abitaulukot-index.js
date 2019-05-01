// This file is part of Abitaulukot
// (C) Sivuduuni Global Oy 2019

function open_url (url) {
  console.log("open_url: "+url);
  window.open(url, "_self");
}

function open_finnish_app () {
  console.log("Opening Finnish app");
  open_url("build/index.html?fi");
}

function open_swedish_app () {
  console.log("Opening Swedish app");
  open_url("build/index.html?sv");
}

function is_pgapp () {
  var app = document.URL.indexOf( 'http://' ) === -1 && document.URL.indexOf( 'https://' ) === -1;
  if ( app ) {
      // PhoneGap application
      return true;
  } else {
      // Web page
      return false;
  }
}

function on_device_ready () {
  if (navigator.globalization == undefined) {
    console.log("navigator.glibalization does not exist, reverting back to language selection page");
    open_url("index-cheat.html");
    return;
  }

  navigator.globalization.getPreferredLanguage(
    function (language) {
      console.log("Detected UI language code: "+language.value);

      if (language.value.substring(0,2) == "sv") {
        // Swedish
        open_swedish_app();
      }

      open_finnish_app();
    },
    function () {
      // Error callback, use default language
      console.log("get_user_language(): Failed to get device UI language, using default value");
      open_finnish_app();
    }
  );
}

function on_load () {
  if (is_pgapp()) {
    console.log("this ia phonegap app");
    document.addEventListener("deviceready", on_device_ready, false);
  }
  else {
    open_url("index-cheat.html");
  }
}
