import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import '../domain/model/model.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "Unknown";
  String identifier = "Unknown";
  String version = "Unknown";

  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
      name = "${build.brand} ${build.model}";
      identifier = build.id;
      version = build.version.codename;
    } else if (Platform.isIOS) {
      IosDeviceInfo build = await deviceInfoPlugin.iosInfo;
      name = "${build.name!} ${build.model!}";
      identifier = build.identifierForVendor!;
      version = build.systemVersion!;
    }
  } catch (e) {
    return DeviceInfo(
      name,
      identifier,
      version,
    );
  }
  return DeviceInfo(
    name,
    identifier,
    version,
  );
}
