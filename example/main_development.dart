import 'package:flavorbanner/flavor_config.dart';
import 'package:flutter/material.dart';
import './lib/app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.DEV,
    color: Colors.grey,
    values: FlavorValues(
      baseUrl: "https://dev.com/",
      showBanner: true,
    ),
  );
  runApp(MyApp());
}