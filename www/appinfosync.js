var exec = require('cordova/exec');
var channel = require('cordova/channel');
var utils = require('cordova/utils');

var eventName = 'onCordovaAppInfoSyncReady';
channel.createSticky(eventName);
channel.waitForInitialization(eventName);

var AppInfoSync = function() {
  var self = this;
  channel.onCordovaReady.subscribe(function() {
    self.getAppInfo(function(info) {
      self.identifier = info.identifier;
      channel[eventName].fire();
    });
  });
};

AppInfoSync.prototype.getAppInfo = function(successCallback, errorCallback) {
  exec(successCallback, errorCallback, "AppInfoSync", "getAppInfo", []);
};

module.exports = new AppInfoSync();