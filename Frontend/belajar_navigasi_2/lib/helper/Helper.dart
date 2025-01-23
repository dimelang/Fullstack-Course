class Helper {
  int colorFromHex(String hexColor) {
    return int.parse(hexColor.replaceAll("#", '0xff'));
  }
}
