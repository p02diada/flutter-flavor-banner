import 'package:flavorbanner/flavor_config.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Flavor Banner'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          FlavorConfig.instance?.values.baseUrl,
        ),
      ),
    );
  }
}
