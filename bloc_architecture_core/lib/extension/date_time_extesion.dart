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
  String toDateString() => DateTimeUtil.convertToDate(this);

  /// Format: HH:mm:ss
  String toTimeString() => DateTimeUtil.convertToTime(this);

  /// Format: yyyy.MM.dd HH:mm:ss
  String toDateTimeString() => DateTimeUtil.convertToDateTime(this);

  /// Format: HH:mm
  String toTimeNoSecondString() => DateTimeUtil.convertToTimeNoSecond(this);

  /// Format: yyyy.MM.dd HH:mm
  String toDateTimeNoSecondString() => DateTimeUtil.convertToDateTimeNoSecond(this);

  /// Format: Now, few Seconds Ago, 1 minutes ago, 2 hours ago, 3 days ago,...
  String toRelativeString(BuildContext context) => DateTimeUtil.convertToDateRelative(context, this);
}

/// Common extension for DateTime null
extension DateTimeNullExtesion on DateTime? {
  /// Format: yyyy.MM.dd
  String toDateString() => this?.toDateString() ?? "";

  /// Format: HH:mm:ss
  String toTimeString() => this?.toTimeString() ?? "";

  /// Format: yyyy.MM.dd HH:mm:ss
  String toDateTimeString() => this?.toDateTimeString() ?? "";

  /// Format: HH:mm
  String toTimeNoSecondString() => this?.toTimeNoSecondString() ?? "";

  /// Format: yyyy.MM.dd HH:mm
  String toDateTimeNoSecondString() => this?.toDateTimeNoSecondString() ?? "";

  /// Format: Now, few Seconds Ago, 1 minutes ago, 2 hours ago, 3 days ago,...
  String toRelativeString(BuildContext context) => this?.toRelativeString(context) ?? "";
}
