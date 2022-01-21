import 'package:device_info_plus/device_info_plus.dart';

import '../enums/build_modes.dart';

class DeviceUtils {
  /// Get current [BuildMode]
  static BuildMode currentBuildMode() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return BuildMode.RELEASE;
    }
    var result = BuildMode.PROFILE;
    //Little trick, since assert only runs on DEBUG mode
    assert(() {
      result = BuildMode.DEBUG;
      return true;
    }());
    return result;
  }

  /// Get Android device info
  static Future<AndroidDeviceInfo> androidDeviceInfo() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    return plugin.androidInfo;
  }

  /// Get android iOS info
  static Future<IosDeviceInfo> iosDeviceInfo() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    return plugin.iosInfo;
  }

  /// Get web browser device info
  static Future<WebBrowserInfo> webDeviceInfo() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    return plugin.webBrowserInfo;
  }
}
