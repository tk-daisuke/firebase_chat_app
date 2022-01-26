class UrlService {
  bool urlChecker(String? url) {
    final urlNullCheck = url != null;
    final isUrl = urlNullCheck ? Uri.parse(url).isAbsolute : false;
    return isUrl;
  }
}
