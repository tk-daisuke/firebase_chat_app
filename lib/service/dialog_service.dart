import 'package:flutter/material.dart';

class DialogService {
  // ignore: long-parameter-list
  void updateDialog(BuildContext context,
      {required Widget dialog, bool? barrierDismissible}) {
    // final _urlLaunch = UrlService();
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return dialog;
      },
    );
    // }

    // AlertDialog _dialog(
    //     String title, String message, String btnLabel, VoidCallback onpress) {
    //   return AlertDialog(
    //     title: Text(
    //       title,
    //       textScaleFactor: 1,
    //     ),
    //     content: Text(
    //       message,
    //       textScaleFactor: 1,
    //     ),
    //     actions: <Widget>[
    //       ElevatedButton(
    //           child: Center(
    //             child: Text(
    //               btnLabel,
    //               textScaleFactor: 1,
    //               // style: TextStyle(color: kButtonText),
    //             ),
    //           ),
    //           onPressed: onpress),
    //     ],
    //   );
    // }
  }
}
