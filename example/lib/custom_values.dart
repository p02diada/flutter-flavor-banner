import 'package:flavorbanner/flavor_config.dart';

class CustomValues extends FlavorValues {
  CustomValues({
    this.baseUrl,
    this.showBanner = false,
    this.mapsApiKey,
  }) ;

  final String baseUrl, mapsApiKey;
  final bool showBanner;
}
