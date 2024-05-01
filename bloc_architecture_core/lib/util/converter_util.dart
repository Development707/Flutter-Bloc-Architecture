// Copyright 2024 The Development707 Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.

import "package:json_annotation/json_annotation.dart";

import "formatter_util.dart";

/// Convert field [DateTime] of Class to [String] of JSON
class ConvertStringToDateTime implements JsonConverter<DateTime, String> {
  /// Create a ConvertStringToDateTime
  const ConvertStringToDateTime();

  @override
  DateTime fromJson(String json) {
    try {
      return DateTimeFormatter.dateTimeConvert.parse(json, true).toLocal();
    } on FormatException catch (_) {
      return DateTime.parse(json);
    }
  }

  @override
  String toJson(DateTime object) {
    return DateTimeFormatter.dateTimeConvert.format(object.toUtc());
  }
}

/// Convert field `Date` of Class to [String] of JSON
class ConvertStringToDate implements JsonConverter<DateTime, String> {
  /// Create a ConvertStringToDate
  const ConvertStringToDate();

  @override
  DateTime fromJson(String json) {
    try {
      return DateTimeFormatter.dateConvert.parse(json);
    } on FormatException catch (_) {
      return DateTime.parse(json);
    }
  }

  @override
  String toJson(DateTime object) {
    return DateTimeFormatter.dateConvert.format(object);
  }
}

/// Convert field [int] of Class to [Object] of JSON
class ConvertToInt implements JsonConverter<int, Object> {
  /// Create a ConvertToInt
  const ConvertToInt();

  @override
  int fromJson(Object json) => switch (json) {
        int() => json,
        double() => json.toInt(),
        String() => int.tryParse(json) ?? 0,
        Object() => json as int,
      };

  @override
  Object toJson(int object) => object;
}

/// Convert field [double] of Class to [Object] of JSON
class ConvertToDouble implements JsonConverter<double, Object> {
  /// Create a ConvertToDouble
  const ConvertToDouble();

  @override
  double fromJson(Object json) => switch (json) {
        int() => json.toDouble(),
        double() => json,
        String() => double.tryParse(json) ?? 0.0,
        Object() => json as double,
      };

  @override
  Object toJson(double object) => object;
}

/// Convert field [bool] of Class to [Object] of JSON
class ConvertToBool implements JsonConverter<bool, Object> {
  /// Create a ConvertToBool
  const ConvertToBool();

  @override
  bool fromJson(Object json) => switch (json) {
        bool() => json,
        int() => json != 0, // 0: false | 1: true
        double() => json != 0.0, // 0: false | 1: true
        String() => bool.tryParse(json, caseSensitive: false) ?? false,
        Object() => json as bool,
      };

  @override
  Object toJson(bool object) => object;
}
