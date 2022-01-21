import 'package:flutter/material.dart';

import 'utils/string_utils.dart';

enum Flavor { TEST, DEV, STAGING, PROD }

class FlavorValues {
  FlavorValues({this.baseUrl, this.showBanner = false});

  final String? baseUrl;
  final bool showBanner;

//Add other flavor specific values, e.g database name

}

class FlavorConfig {
  /// Enum of flavor
  final Flavor flavor;

  /// Name of flavor
  final String name;

  /// Color of banner flavor
  final Color color;

  /// Dynamic values
  /// Will be extended of [FlavorValues]
  final FlavorValues values;

  static FlavorConfig? _instance;

  /// Config flavor with internal instance.
  ///
  /// By default color will be [Colors.blue]
  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      StringUtils.enumName(flavor.toString()),
      color,
      values,
    );
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig? get instance {
    return _instance;
  }

  /// If show banner, return [true]
  static bool showBanner() => _instance!.values.showBanner == true;
}
