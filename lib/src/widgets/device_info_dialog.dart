import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../utils/device_utils.dart';
import '../utils/string_utils.dart';
import '../flavor_config.dart';

/// Alert dialog with device info details
class DeviceInfoDialog extends StatelessWidget {
  const DeviceInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(bottom: 10.0),
      title: Container(
        padding: const EdgeInsets.all(15.0),
        color: FlavorConfig.instance!.color,
        child: const Text(
          'Device Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      content: _getContent(),
    );
  }

  Widget _getContent() {
    if (kIsWeb) return _webContent();

    if (Platform.isAndroid) {
      return _androidContent();
    }

    if (Platform.isIOS) {
      return _iOSContent();
    }

    return const Text("You're not on Android neither iOS");
  }

  Widget _webContent() {
    return FutureBuilder(
      future: DeviceUtils.webDeviceInfo(),
      builder: (context, AsyncSnapshot<WebBrowserInfo> snapshot) {
        if (!snapshot.hasData) return Container();
        WebBrowserInfo device = snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTile('Flavor:', FlavorConfig.instance!.name),
              _buildTile(
                  'Build mode:',
                  StringUtils.enumName(
                      DeviceUtils.currentBuildMode().toString())),
              _buildTile('Platform:', '${device.platform}'),
              _buildTile('Product:', '${device.productSub}'),
              _buildTile('User Agent:', '${device.userAgent}'),
              _buildTile('Vendor:', '${device.vendorSub}'),
              _buildTile('Language:', '${device.language}'),
              FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                  if (!snapshot.hasData) return Container();
                  return _buildTile('App version:', snapshot.data!.version);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _iOSContent() {
    return FutureBuilder(
      future: DeviceUtils.iosDeviceInfo(),
      builder: (context, AsyncSnapshot<IosDeviceInfo> snapshot) {
        if (!snapshot.hasData) return Container();
        IosDeviceInfo device = snapshot.data!;
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildTile('Flavor:', FlavorConfig.instance!.name),
              _buildTile(
                  'Build mode:',
                  StringUtils.enumName(
                      DeviceUtils.currentBuildMode().toString())),
              _buildTile('Physical device?:', '${device.isPhysicalDevice}'),
              _buildTile('Device:', '${device.name}'),
              _buildTile('Model:', '${device.model}'),
              _buildTile('System name:', '${device.systemName}'),
              _buildTile('System version:', '${device.systemVersion}'),
              FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                  if (!snapshot.hasData) return Container();
                  return _buildTile('App version:', snapshot.data!.version);
                },
              ),
              FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                  if (!snapshot.hasData) return Container();
                  return _buildTile(
                      'App package name:', snapshot.data!.packageName);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _androidContent() {
    return FutureBuilder(
        future: DeviceUtils.androidDeviceInfo(),
        builder: (context, AsyncSnapshot<AndroidDeviceInfo> snapshot) {
          if (!snapshot.hasData) return Container();

          AndroidDeviceInfo device = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildTile('Flavor:', FlavorConfig.instance!.name),
                _buildTile(
                    'Build mode:',
                    StringUtils.enumName(
                        DeviceUtils.currentBuildMode().toString())),
                _buildTile('Physical device?:', '${device.isPhysicalDevice}'),
                _buildTile('Manufacturer:', '${device.manufacturer}'),
                _buildTile('Model:', '${device.model}'),
                _buildTile('Android version:', '${device.version.release}'),
                _buildTile('Android SDK:', '${device.version.sdkInt}'),
                FutureBuilder(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                    if (!snapshot.hasData) return Container();
                    return _buildTile('App version:', snapshot.data!.version);
                  },
                ),
                FutureBuilder(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                    if (!snapshot.hasData) return Container();
                    return _buildTile(
                        'App package name:', snapshot.data!.packageName);
                  },
                ),
              ],
            ),
          );
        });
  }

  Widget _buildTile(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              key,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value))
        ],
      ),
    );
  }
}
