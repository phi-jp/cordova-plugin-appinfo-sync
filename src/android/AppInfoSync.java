package jp.phi.cordova.plugin.appinfosync;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;


public class AppInfoSync extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("getAppInfo")) {
            this.getAppInfo(callbackContext);
            return true;
        }
        return false;
    }
    private void getAppInfo(CallbackContext callbackContext) throws JSONException {
        PackageManager packageManager = this.cordova.getActivity().getPackageManager();
        String packageName = this.cordova.getActivity().getPackageName();
        String version = "";
        int versionCode = 0;
        boolean debug = true;

        try {
            PackageInfo packageInfo = packageManager.getPackageInfo(packageName, 0);
            version = packageInfo.versionName;
            versionCode = packageInfo.versionCode;

        } catch (NameNotFoundException e) {
        }

//        Class<?> buildConfigClass = Class.forName(packageName + ".BuildConfig");
//        boolean debug = buildConfigClass.getField("DEBUG").getBoolean(null);

        JSONObject r = new JSONObject();
        r.put("name", packageName);
        r.put("identifier", packageName);
        r.put("version", version);
        r.put("versionCode", versionCode);
        r.put("build", versionCode);
        r.put("debug", debug); // bool

        callbackContext.success(r);
    }
}