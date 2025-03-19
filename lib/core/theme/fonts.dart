import 'package:flutter/material.dart';

class AppFonts {
  // MTSCompact Family
  static const String mtsCompact = 'MTSCompact';

  static const TextStyle mtsCompactRegular = TextStyle(
    fontFamily: mtsCompact,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle mtsCompactMedium = TextStyle(
    fontFamily: mtsCompact,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mtsCompactBold = TextStyle(
    fontFamily: mtsCompact,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle mtsCompactBlack = TextStyle(
    fontFamily: mtsCompact,
    fontWeight: FontWeight.w900,
  );

  // MTSText Family
  static const String mtsText = 'MTSText';

  static const TextStyle mtsTextRegular = TextStyle(
    fontFamily: mtsText,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle mtsTextMedium = TextStyle(
    fontFamily: mtsText,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mtsTextBold = TextStyle(
    fontFamily: mtsText,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle mtsTextBlack = TextStyle(
    fontFamily: mtsText,
    fontWeight: FontWeight.w900,
  );

  // MTSWide Family
  static const String mtsWide = 'MTSWide';

  static const TextStyle mtsWideRegular = TextStyle(
    fontFamily: mtsWide,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle mtsWideMedium = TextStyle(
    fontFamily: mtsWide,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mtsWideBold = TextStyle(
    fontFamily: mtsWide,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle mtsWideBlack = TextStyle(
    fontFamily: mtsWide,
    fontWeight: FontWeight.w900,
  );

  // Helper methods to get styles with custom sizes
  static TextStyle getCompactRegular({double? size, Color? color}) {
    return mtsCompactRegular.copyWith(fontSize: size, color: color);
  }

  static TextStyle getCompactMedium({double? size, Color? color}) {
    return mtsCompactMedium.copyWith(fontSize: size, color: color);
  }

  static TextStyle getCompactBold({double? size, Color? color}) {
    return mtsCompactBold.copyWith(fontSize: size, color: color);
  }

  static TextStyle getCompactBlack({double? size, Color? color}) {
    return mtsCompactBlack.copyWith(fontSize: size, color: color);
  }

  static TextStyle getTextRegular({double? size, Color? color}) {
    return mtsTextRegular.copyWith(fontSize: size, color: color);
  }

  static TextStyle getTextMedium({double? size, Color? color}) {
    return mtsTextMedium.copyWith(fontSize: size, color: color);
  }

  static TextStyle getTextBold({double? size, Color? color}) {
    return mtsTextBold.copyWith(fontSize: size, color: color);
  }

  static TextStyle getTextBlack({double? size, Color? color}) {
    return mtsTextBlack.copyWith(fontSize: size, color: color);
  }

  static TextStyle getWideRegular({double? size, Color? color}) {
    return mtsWideRegular.copyWith(fontSize: size, color: color);
  }

  static TextStyle getWideMedium({double? size, Color? color}) {
    return mtsWideMedium.copyWith(fontSize: size, color: color);
  }

  static TextStyle getWideBold({double? size, Color? color}) {
    return mtsWideBold.copyWith(fontSize: size, color: color);
  }

  static TextStyle getWideBlack({double? size, Color? color}) {
    return mtsWideBlack.copyWith(fontSize: size, color: color);
  }
}
