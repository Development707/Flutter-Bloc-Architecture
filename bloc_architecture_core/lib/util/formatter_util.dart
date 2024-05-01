// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:math" as math;

import "package:flutter/services.dart";
import "package:intl/intl.dart";

/// Style format number
class NumberFormatter {
  const NumberFormatter._();

  /// Format: '#,##0.###'
  static NumberFormat get decimal => NumberFormat.decimalPattern();

  /// Format: '#E0'
  static NumberFormat get scientific => NumberFormat.scientificPattern();

  /// Format: '#,##0%'
  static NumberFormat get percent => NumberFormat.percentPattern();

  /// Format: '#,##0.00 VND',
  static NumberFormat get currency => NumberFormat.currency();
}

/// Style format DateTime
class DateTimeFormatter {
  const DateTimeFormatter._();

  /// Convert: yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
  static final DateFormat dateTimeConvert = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

  /// Convert: yyyy-MM-dd
  static final DateFormat dateConvert = DateFormat("yyyy-MM-dd");

  /// Format: yyyy/MM/dd HH:mm:ss
  static final DateFormat dateTimeFormatSlash = DateFormat("yyyy/MM/dd HH:mm:ss");

  /// Format: yyyy/MM/dd
  static final DateFormat dateFormatSlash = DateFormat("yyyy/MM/dd");

  /// Format: yyyy-MM-dd HH:mm:ss
  static final DateFormat dateTimeFormatHyphen = DateFormat("yyyy-MM-dd HH:mm:ss");

  /// Format: yyyy-MM-dd
  static final DateFormat dateFormatHyphen = DateFormat("yyyy-MM-dd");

  /// Format: yyyy.MM.dd HH:mm:ss
  static final DateFormat dateTimeFormatDot = DateFormat("yyyy.MM.dd HH:mm:ss");

  /// Format: yyyy.MM.dd
  static final DateFormat dateFormatDot = DateFormat("yyyy.MM.dd");

  /// Format: HH:mm:ss
  static final DateFormat timeFormat = DateFormat("HH:mm:ss");

  /// Format: HH:mm
  static final DateFormat timeNoSecondFormat = DateFormat("HH:mm");

  /// Format: HH:mm:ss
  static final DateFormat l10nTimeFormat = DateFormat.Hms();

  /// Format: HH:mm
  static final DateFormat l10nTimeNoSecondFormat = DateFormat.Hm();

  /// Format: dd/MM/yyyy
  static final DateFormat l10nDateFormat = DateFormat.yMd();

  /// Format: dd/MM/yyyy HH:mm:ss
  static final DateFormat l10nDateTimeFormat = DateFormat.yMd().add_Hms();

  /// Format: dd/MM/yyyy HH:mm
  static final DateFormat l10nDateTimeNoSecondFormat = DateFormat.yMd().add_Hm();
}

/// TextInputFormatter for Date
class DateTextFormatter extends TextInputFormatter {
  /// Create a DateTextFormatter
  const DateTextFormatter({this.seperator = "-"});

  /// Seperator for Date style
  final String seperator;

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = _format(newValue.text, seperator);
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    final String newValue = value.replaceAll(seperator, "");
    final StringBuffer buffer = StringBuffer();

    for (int i = 0; i < math.min(newValue.length, 8); i++) {
      buffer.write(newValue[i]);
      if ((i == 3 || i == 5) && i != newValue.length - 1) {
        buffer.write(seperator);
      }
    }

    return buffer.toString();
  }

  /// Move curso to end
  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
