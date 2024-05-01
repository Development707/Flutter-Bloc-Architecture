// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "../../../util/util.dart";

/// Common function Log
mixin LogMixin on Object {
  /// Log data
  void logD(String message, {DateTime? time}) {
    LogUtil.d(message, name: runtimeType.toString(), time: time);
  }

  /// Log error
  void logE(
    Object? errorMessage, {
    Object? errorObject,
    StackTrace? stackTrace,
    DateTime? time,
  }) {
    LogUtil.e(
      errorMessage,
      name: runtimeType.toString(),
      errorObject: errorObject,
      stackTrace: stackTrace,
      time: time,
    );
  }
}
