import 'package:firebase_template_app/data/localize/flutter_fire/ja.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:intl/intl.dart';

class FlutterFireUIJA
    extends LocalizationsDelegate<FlutterFireUILocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'ja';
  }

  @override
  Future<FlutterFireUILocalizations<FlutterFireUILocalizationLabels>> load(
      Locale locale) {
    final flutterFireUILocalizations =
        FlutterFireUILocalizations(locale, const JaLocalizations());
    return SynchronousFuture<FlutterFireUILocalizations>(
        flutterFireUILocalizations);
  }

  @override
  bool shouldReload(
          covariant LocalizationsDelegate<
                  FlutterFireUILocalizations<FlutterFireUILocalizationLabels>>
              old) =>
      false;
}
