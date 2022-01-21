import 'package:flavorbanner/flavorbanner.dart';
import 'package:flutter/material.dart';
import './lib/app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.TEST,
    color: Colors.orange,
    values: FlavorValues(
      baseUrl: "https://test.com/",
      showBanner: true,
    ),
  );
  runApp(const MyApp());
}
