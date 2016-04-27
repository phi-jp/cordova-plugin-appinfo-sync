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
      for (var key in info) {
        var v = info[key];
        self[key] = v;
      }
      channel[eventName].fire();
    });
  });
};

AppInfoSync.prototype.getAppInfo = function(successCallback, errorCallback) {
  exec(successCallback, errorCallback, "AppInfoSync", "getAppInfo", []);
};

module.exports = new AppInfoSync();