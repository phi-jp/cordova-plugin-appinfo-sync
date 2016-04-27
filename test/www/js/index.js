
// for cordova
document.addEventListener('deviceready', function() {
  console.log(cordova.appInfoSync);
  var c = document.querySelector('.console');

  c.innerHTML = JSON.stringify(cordova.appInfoSync, null, '  ');
});
