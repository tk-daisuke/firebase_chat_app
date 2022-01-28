import 'package:url_launcher/url_launcher.dart';

class UrlService {
  bool urlChecker(String? url) {
    final urlNullCheck = url != null;
    final isUrl = urlNullCheck ? Uri.parse(url).isAbsolute : false;
    return isUrl;
  }

  void launchURL(String _url) async {
    final Error error = ArgumentError('開けませんでした$_url');
    await canLaunch(_url) ? await launch(_url) : throw error;
  }
}
