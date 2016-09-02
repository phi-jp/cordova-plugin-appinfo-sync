# cordova-plugin-appinfo-sync
cordova-plugin-appinfo-sync

- name ... 'Arrow Flicker'(CFBundleDisplayName)
- identifier ... 'jp.phi.testapp'(CFBundleIdentifier)
- version ... `1.0.2`(CFBundleShortVersionString)
- versionCode ... `1.1.2` 開発用 (CFBundleVersion)
- build ... iOS: `1.0.1.2`, Android: `21`(versionCode)
- debug ... `true` or `false`

## Installation

```
$ cordova plugins add cordova-plugin-appinfo-sync
```

## test

```
$ cd test
$ cordova platform add ios
$ cordova plugin add --link ../
$ cordova emulate ios
$ cordova build android
```

## License

MIT


## Ref

- https://github.com/whiteoctober/cordova-plugin-app-version
  - 一番スターが多い
- https://github.com/danmichaelo/cordova-plugin-appinfo
- https://github.com/welldone-software/cordova-plugin-app-info
  - debug がある
- https://github.com/Rareloop/cordova-plugin-app-version
  - 唯一同期取得
