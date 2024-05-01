// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/widgets.dart";
import "package:intl/intl.dart";

import "../util/util.dart";

/// Common extension for DateTime
extension DateTimeExtesion on DateTime {
  /// To string by format
  String toStringByFormat(DateFormat format) => format.format(this);

  /// Format: yyyy.MM.dd
  String get toDateString => DateTimeUtil.convertToDate(this);

  /// Format: HH:mm:ss
  String get toTimeString => DateTimeUtil.convertToTime(this);

  /// Format: yyyy.MM.dd HH:mm:ss
  String get toDateTimeString => DateTimeUtil.convertToDateTime(this);

  /// Format: HH:mm
  String get toTimeNoSecondString => DateTimeUtil.convertToTimeNoSecond(this);

  /// Format: yyyy.MM.dd HH:mm
  String get toDateTimeNoSecondString => DateTimeUtil.convertToDateTimeNoSecond(this);

  /// Format: Now, few Seconds Ago, 1 minutes ago, 2 hours ago, 3 days ago,...
  String toRelativeString(BuildContext context) => DateTimeUtil.convertToDateRelative(context, this);
}

/// Common extension for DateTime null
extension DateTimeNullExtesion on DateTime? {
  /// Format: yyyy.MM.dd
  String get toDateString => this?.toDateString ?? "";

  /// Format: HH:mm:ss
  String get toTimeString => this?.toTimeString ?? "";

  /// Format: yyyy.MM.dd HH:mm:ss
  String get toDateTimeString => this?.toDateTimeString ?? "";

  /// Format: HH:mm
  String get toTimeNoSecondString => this?.toTimeNoSecondString ?? "";

  /// Format: yyyy.MM.dd HH:mm
  String get toDateTimeNoSecondString => this?.toDateTimeNoSecondString ?? "";

  /// Format: Now, few Seconds Ago, 1 minutes ago, 2 hours ago, 3 days ago,...
  String toRelativeString(BuildContext context) => this?.toRelativeString(context) ?? "";
}
