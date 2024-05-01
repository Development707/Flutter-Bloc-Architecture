// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:bloc_architecture_localization/bloc_architecture_localization.dart";
import "package:flutter/widgets.dart";

import "../extension/extension.dart";
import "formatter_util.dart";

/// Until handle DateTime
class DateTimeUtil {
  const DateTimeUtil._();

  /// Return a string representing format: yyyy-MM-dd
  static String convertToDate(DateTime dateTime) {
    return DateTimeFormatter.l10nDateFormat.format(dateTime);
  }

  /// Return a string representing format: HH:mm:ss
  static String convertToTime(DateTime dateTime) {
    return DateTimeFormatter.l10nTimeFormat.format(dateTime);
  }

  /// Return a string representing format: HH:mm
  static String convertToTimeNoSecond(DateTime dateTime) {
    return DateTimeFormatter.l10nTimeNoSecondFormat.format(dateTime);
  }

  /// Return a string representing format: yyyy-MM-dd HH:mm:ss
  static String convertToDateTime(DateTime dateTime) {
    return DateTimeFormatter.l10nDateTimeFormat.format(dateTime);
  }

  /// Return a string representing format: yyyy-MM-dd HH:mm
  static String convertToDateTimeNoSecond(DateTime dateTime) {
    return DateTimeFormatter.l10nDateTimeNoSecondFormat.format(dateTime);
  }

  /// Return a string representing format: Now, few Seconds Ago, 1 minutes ago, 2 hours ago, 3 days ago,...
  static String convertToDateRelative(
    BuildContext context,
    DateTime dateTime, {
    Duration? formatAfter,
    Duration? timeShowNow = const Duration(seconds: 10),
  }) {
    final DateTime now = DateTime.now();
    final BlocArchitectureLocalizations? l10n = context.blocArchitecturel10n;
    // After now
    if (dateTime.isAfter(now)) {
      return convertToDateTime(dateTime);
    }
    // Before formatAfter
    final Duration difference = dateTime.difference(now).abs();
    if (formatAfter != null && difference >= formatAfter) {
      return convertToDateTime(dateTime);
    }
    // Less timeShowNow
    if (timeShowNow != null && difference < timeShowNow) {
      return l10n?.now ?? "now";
    }
    // Defaut
    if (difference < const Duration(minutes: 1)) {
      return l10n?.fewSecondsAgo ?? "few seconds ago";
    } else if (difference < const Duration(hours: 1)) {
      return l10n?.minutesRelative(difference.inMinutes) ?? "${difference.inMinutes} minutes ago";
    } else if (difference < const Duration(days: 1)) {
      return l10n?.hoursRelative(difference.inHours) ?? "${difference.inHours} hours ago";
    } else if (difference < const Duration(days: 30)) {
      return l10n?.daysRelative(difference.inDays) ?? "${difference.inDays} days ago";
    } else if (difference < const Duration(days: 90)) {
      return convertToDate(dateTime);
    } else {
      return convertToDateTime(dateTime);
    }
  }
}
