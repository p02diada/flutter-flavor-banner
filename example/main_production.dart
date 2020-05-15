import 'package:flavorbanner/flavor_config.dart';
import 'package:flutter/material.dart';
import './lib/app.dart';
import './lib/custom_values.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.PROD,
    color: Colors.red,
    values: CustomValues(
      baseUrl: "https://prod.com/",
      mapsApiKey: 'mapsApiKey',
    ),
  );
  runApp(MyApp());
}