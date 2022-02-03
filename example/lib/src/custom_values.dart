import 'package:flavorbanner/flavorbanner.dart';

class CustomValues extends FlavorValues {
  CustomValues({
    String? baseUrl,
    bool showBanner = false,
    required this.mapsApiKey,
  });

  final String mapsApiKey;
}
