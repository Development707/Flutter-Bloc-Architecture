// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:flutter/widgets.dart";

/// Common extension for Iterable
extension IterableExtension<T> on Iterable<T> {
  /// Maps each element and its index to a new value.
  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    for (int index = 0; index < length; index++) {
      yield convert(index, elementAt(index));
    }
  }
}

/// Common extension for List Widget
extension ListWidgetrExtension on List<Widget> {
  /// Apply Widget Sepator for list Widget
  List<Widget> applySeparator(Widget separator) {
    return mapIndexed(
      (int index, Widget item) => <Widget>[
        if (index != 0) separator,
        item,
      ],
    ).expand((List<Widget> element) => element).toList();
  }
}
