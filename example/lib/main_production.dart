import 'package:example/src/custom_values.dart';
import 'package:flavorbanner/flavorbanner.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.PROD,
    color: Colors.red,
    values: CustomValues(
      baseUrl: "https://prod.com/",
      mapsApiKey: 'mapsApiKey',
    ),
  );
  runApp(const MyApp());
}
