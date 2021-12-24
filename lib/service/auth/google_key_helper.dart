import 'dart:io';

import 'package:firebase_template_app/data/keys.dart';

class GoogleKeyHelper {
  String getAppID() {
    final String appid;
    if (Platform.isAndroid) {
      appid = kFirebaseAndroidAppID;
    } else if (Platform.isIOS) {
      appid = kFirebaseIosAppID;
    } else {
      appid = '';
    }
    return appid;
  }
}
