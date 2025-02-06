class Helper {
  int colorFromHex(String hexColor) {
    return int.parse(hexColor.replaceAll("#", '0xff'));
  }

  String buildUrlWithUnencodedQuery(
      String baseUrl, Map<String, dynamic> parameters) {
    final queryString = parameters.entries
        .map((entry) => '${entry.key}=${entry.value}')
        .join('&');
    return '$baseUrl?$queryString';
  }
}
