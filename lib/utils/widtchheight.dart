import 'package:flutter/widgets.dart';

class MediaQueryHelper {
  static MediaQueryData get mediaQueryData {
    return MediaQueryData.fromView(WidgetsBinding.instance.window);
  }

  static double get screenHeight {
    return mediaQueryData.size.height;
  }

  static double get screenWidth {
    return mediaQueryData.size.width;
  }

  static double get devicePixelRatio {
    return mediaQueryData.devicePixelRatio;
  }
}