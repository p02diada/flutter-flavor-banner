import 'package:flutter/material.dart';

import 'device_info_dialog.dart';
import '../flavor_config.dart';

class FlavorBanner extends StatefulWidget {
  final Widget child;

  FlavorBanner({@required this.child});

  @override
  _FlavorBannerState createState() => _FlavorBannerState();
}

class _FlavorBannerState extends State<FlavorBanner> {
  BannerConfig bannerConfig;
  bool showDeviceInfoDialog = false;

  void showDeviceInfo(bool show){
    setState(() {
      showDeviceInfoDialog = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!FlavorConfig.showBanner()) return widget.child;
    bannerConfig ??= _getDefaultBanner();
    return Stack(
      children: <Widget>[
        GestureDetector(child: widget.child, onTap: () => showDeviceInfo(false)),
        _buildBanner(context),
        showDeviceInfoDialog == true ? DeviceInfoDialog() : Container(),
      ],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance.name,
        bannerColor: FlavorConfig.instance.color
    );
  }

  Widget _buildBanner(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 35,
        height: 55,
        child: CustomPaint(
          painter: BannerPainter(
              message: bannerConfig.bannerName,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topStart,
              color: bannerConfig.bannerColor
          ),
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
  BannerConfig({
    @required this.bannerName,
    @required this.bannerColor});
}