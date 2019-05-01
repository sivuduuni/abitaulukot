// This file is part of Abitaulukot
// (C) Sivuduuni Global Oy 2019

function log_message (message) {
  console.log("[Abitaulukot] "+message);
}

function open_url (url) {
  log_message("open_url: "+url);
  window.open(url, "_self");
}

function open_finnish_app () {
  log_message("Opening Finnish app");
  open_url("build/index.html?fi");
}

function open_swedish_app () {
  log_message("Opening Swedish app");
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
    log_message("navigator.glibalization does not exist, reverting back to language selection page");
    open_url("index-cheat.html");
    return;
  }

  navigator.globalization.getPreferredLanguage(
    function (language) {
      log_message("Detected UI language code: "+language.value);

      if (language.value.substring(0,2) == "sv") {
        // Swedish
        open_swedish_app();
      }

      open_finnish_app();
    },
    function () {
      // Error callback, use default language
      log_message("get_user_language(): Failed to get device UI language, using default value");
      open_finnish_app();
    }
  );
}

function on_load () {
  if (is_pgapp()) {
    log_message("This is a PhoneGap app");
    document.addEventListener("deviceready", on_device_ready, false);
  }
  else {
    log_message("This is a browser app")
    open_url("index-cheat.html");
  }
}
