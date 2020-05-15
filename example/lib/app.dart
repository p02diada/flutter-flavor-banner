import 'package:flavorbanner/widgets/flavor_banner.dart';
import 'package:flutter/material.dart';
import './first_page.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
      builder: (context, child) => FlavorBanner(
        child: child,
      ),
    );
  }
}
