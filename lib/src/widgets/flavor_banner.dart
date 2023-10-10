import 'package:flutter/material.dart';

import '../flavor_config.dart';
import 'device_info_dialog.dart';

/// Flavor banner widget
///
/// Overlay banner on the top left corner of the screen.
/// Apply color and name from FlavorConfig
///
/// When press this banner, show dialog with device info
class FlavorBanner extends StatefulWidget {
  final Widget child;

  const FlavorBanner({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _FlavorBannerState createState() => _FlavorBannerState();
}

class _FlavorBannerState extends State<FlavorBanner> {
  BannerConfig? bannerConfig;
  bool showDeviceInfoDialog = false;

  void showDeviceInfo(bool show) {
    setState(() {
      showDeviceInfoDialog = false; // Hairo: show; disabled
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!FlavorConfig.showBanner()) return widget.child;
    bannerConfig ??= _getDefaultBanner();
    return Stack(
      children: <Widget>[
        GestureDetector(
            child: widget.child, onTap: () => showDeviceInfo(false)),
        _buildBanner(context),
        showDeviceInfoDialog == true ? const DeviceInfoDialog() : Container(),
      ],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance!.name,
        bannerColor: FlavorConfig.instance!.color);
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        width: 35,
        height: 55,
        child: CustomPaint(
          painter: BannerPainter(
              message: bannerConfig!.bannerName,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topStart,
              color: bannerConfig!.bannerColor),
        ),
      ),
      onLongPress: () {
        showDeviceInfo(!showDeviceInfoDialog);
      },
      onTap: () {
        showDeviceInfo(!showDeviceInfoDialog);
      },
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig({required this.bannerName, required this.bannerColor});
}
