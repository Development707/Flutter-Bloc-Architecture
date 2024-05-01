// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "dart:async";
import "dart:convert";
import "dart:developer" as dev;

import "package:flutter/foundation.dart";

/// Until log data, error, ...
class LogUtil {
  const LogUtil._();

  /// Enable log
  static bool enableLog = kDebugMode;

  /// Pretty json
  static bool isPrettyJson = kDebugMode;

  /// Log data
  static void d(
    Object? message, {
    String? name,
    DateTime? time,
  }) {
    log("💡 $message", name: name ?? "", time: time);
  }

  /// Log error
  static void e(
    Object? errorMessage, {
    String? name,
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    log(
      "💢 $errorMessage",
      name: name ?? "",
      error: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }

  /// Log record error
  static void recordError(Object error, StackTrace stack) => e("RecordError", errorObject: error, stackTrace: stack);

  /// Log JSON pretty
  static String prettyJson(Object json) {
    if (!LogUtil.isPrettyJson) {
      return json.toString();
    }

    const JsonEncoder encoder = JsonEncoder.withIndent("\t");

    return encoder.convert(json);
  }

  /// Emit a log event.
  ///
  /// This function was designed to map closely to the logging information
  /// collected by `package:logging`.
  ///
  /// - [message] is the log message
  /// - [time] (optional) is the timestamp
  /// - [sequenceNumber] (optional) is a monotonically increasing sequence number
  /// - [level] (optional) is the severity level (a value between 0 and 2000); see
  ///   the `package:logging` `Level` class for an overview of the possible values
  /// - [name] (optional) is the name of the source of the log message
  /// - [zone] (optional) the zone where the log was emitted
  /// - [error] (optional) an error object associated with this log event
  /// - [stackTrace] (optional) a stack trace associated with this log event
  static void log(
    String message, {
    int level = 0,
    String name = "LogUtil",
    DateTime? time,
    int? sequenceNumber,
    Zone? zone,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (LogUtil.enableLog) {
      dev.log(
        message,
        name: name,
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
