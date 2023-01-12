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
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      name = androidInfo.model;
      identifier = androidInfo.id;
      version = androidInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      name = iosInfo.name!;
      identifier = iosInfo.identifierForVendor!;
      version = iosInfo.systemVersion!;
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
