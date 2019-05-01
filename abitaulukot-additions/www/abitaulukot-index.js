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

function on_load () {
  if (is_pgapp()) {
    log_message("This is a PhoneGap app");
    var lang = navigator.language || navigator.userLanguage;
    log_message("My language code is: "+lang);

    if (lang.substring(0,2) == "sv") {
      // Swedish
      open_swedish_app();
    }
    else {
      // Defaults to Finnish
      open_finnish_app();
    }
  }
  else {
    log_message("This is a browser app")
    open_url("index-cheat.html");
  }
}
