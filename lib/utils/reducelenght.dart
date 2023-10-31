class StringShortener {
  static String shortenString(String originalString, int maxLength) {
    if (originalString.length <= maxLength) {
      return originalString;
    }
    return originalString.substring(0, maxLength - 3) + '... Readmore';
  }
}