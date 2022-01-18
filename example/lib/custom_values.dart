import 'package:flavorbanner/flavor_config.dart';

class CustomValues extends FlavorValues {
  CustomValues({
    required this.baseUrl,
    this.showBanner = false,
    required this.mapsApiKey,
  });

  final String baseUrl, mapsApiKey;
  final bool showBanner;
}
