# Example

First, configure your main files for each enviroment

```dart
import 'package:flavorbanner/flavorbanner.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.DEV,
    color: Colors.grey,
    values: FlavorValues(
      baseUrl: "https://dev.com/",
      showBanner: true,
    ),
  );
  runApp(const MyApp());
}
```

Second, wrap your app with FlavorBanner

```dart
import 'package:flavorbanner/flavorbanner.dart';
import 'package:flutter/material.dart';
import './first_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FirstPage(),
      builder: (context, child) => FlavorBanner(
        child: child ?? Container(),
      ),
    );
  }
}
```

Now can see banner in top left corner, but you can show flavor info in your pages too, like this:

```dart
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
```

By last, you can extend the FlavorValues with your custom values:

```dart
import 'package:flavorbanner/flavorbanner.dart';

class CustomValues extends FlavorValues {
  CustomValues({
    String? baseUrl,
    bool showBanner = false,
    required this.mapsApiKey,
  });

  final String mapsApiKey;
}
```
