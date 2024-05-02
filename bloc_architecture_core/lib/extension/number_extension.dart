// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "../util/util.dart";

/// Common extension for number
extension NumberExtension on num {
  /// Convert number to currency
  String toCurrency() => NumberFormatter.currency.format(this);

  /// Convert number to decimal
  String toDecimal() => NumberFormatter.decimal.format(this);

  /// Convert number to percent
  String toPercent() => NumberFormatter.percent.format(this);
}
