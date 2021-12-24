import 'package:firebase_template_app/service/url_launch.dart';
import 'package:flutter/material.dart';

class Dialog {
  // ignore: long-parameter-list
  void updateDialog(BuildContext context, String title, String message,
      String btnLabel, String url) {
    final _urlLaunch = UrlLaunch();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            textScaleFactor: 1,
          ),
          content: Text(
            message,
            textScaleFactor: 1,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Center(
                child: Text(
                  btnLabel,
                  textScaleFactor: 1,
                  // style: TextStyle(color: kButtonText),
                ),
              ),
              onPressed: () => _urlLaunch.launchURL(url),
            ),
          ],
        );
      },
    );
  }
}
