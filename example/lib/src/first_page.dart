import 'package:flavorbanner/flavorbanner.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Flavor Banner'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          FlavorConfig.instance?.values.baseUrl ?? '',
        ),
      ),
    );
  }
}
