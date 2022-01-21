import 'package:flavorbanner/flavor_config.dart';

class CustomValues extends FlavorValues {
  CustomValues({
    String? baseUrl,
    bool showBanner = false,
    required this.mapsApiKey,
  });

  final String mapsApiKey;
}
