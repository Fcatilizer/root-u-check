import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _Info();
}

class _Info extends State<Info> {
  String _deviceName = "";
  String _deviceModel = "";
  String _deviceBrand = "";
  String _deviceBoard = "";
  String _deviceBootloader = "";
  String _deviceDisplay = "";
  String _deviceFingerprint = "";
  String _deviceHardware = "";
  String _deviceHost = "";
  String _deviceId = "";
  String _deviceManufacturer = "";
  String _deviceProduct = "";
  String _deviceTags = "";
  String _deviceType = "";
  String _deviceVersionBaseOs = "";
  String _deviceVersionCodename = "";
  String _deviceVersionIncremental = "";
  String _deviceVersionPreviewSdk = "";
  String _deviceVersionRelease = "";
  String _deviceVersionSdk = "";
  String _deviceVersionSecurityPatch = "";

  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    setState(() {
      _deviceName = androidInfo.device;
      _deviceModel = androidInfo.model;
      _deviceBrand = androidInfo.brand;
      _deviceBoard = androidInfo.board;
      _deviceBootloader = androidInfo.bootloader;
      _deviceDisplay = androidInfo.display;
      _deviceFingerprint = androidInfo.fingerprint;
      _deviceHardware = androidInfo.hardware;
      _deviceHost = androidInfo.host;
      _deviceId = androidInfo.id;
      _deviceManufacturer = androidInfo.manufacturer;
      _deviceProduct = androidInfo.product;
      _deviceTags = androidInfo.tags;
      _deviceType = androidInfo.type;
      _deviceVersionBaseOs = androidInfo.version.baseOS!;
      _deviceVersionCodename = androidInfo.version.codename;
      _deviceVersionIncremental = androidInfo.version.incremental;
      _deviceVersionPreviewSdk = androidInfo.version.previewSdkInt.toString();
      _deviceVersionRelease = androidInfo.version.release;
      _deviceVersionSdk = androidInfo.version.sdkInt.toString();
      _deviceVersionSecurityPatch = androidInfo.version.securityPatch!;
    });
  }

  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device Info"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Device Name"),
            subtitle: Text(_deviceName),
          ),
          ListTile(
            title: const Text("Device Model"),
            subtitle: Text(_deviceModel),
          ),
          ListTile(
            title: const Text("Device Brand"),
            subtitle: Text(_deviceBrand),
          ),
          ListTile(
            title: const Text("Device Board"),
            subtitle: Text(_deviceBoard),
          ),
          ListTile(
            title: const Text("Device Bootloader"),
            subtitle: Text(_deviceBootloader),
          ),
          ListTile(
            title: const Text("Device Display"),
            subtitle: Text(_deviceDisplay),
          ),
          ListTile(
            title: const Text("Device Fingerprint"),
            subtitle: Text(_deviceFingerprint),
          ),
          ListTile(
            title: const Text("Device Hardware"),
            subtitle: Text(_deviceHardware),
          ),
          ListTile(
            title: const Text("Device Host"),
            subtitle: Text(_deviceHost),
          ),
          ListTile(
            title: const Text("Device ID"),
            subtitle: Text(_deviceId),
          ),
          ListTile(
            title: const Text("Device Manufacturer"),
            subtitle: Text(_deviceManufacturer),
          ),
          ListTile(
            title: const Text("Device Product"),
            subtitle: Text(_deviceProduct),
          ),
          ListTile(
            title: const Text("Device Tags"),
            subtitle: Text(_deviceTags),
          ),
          ListTile(
            title: const Text("Device Type"),
            subtitle: Text(_deviceType),
          ),
          ListTile(
            title: const Text("Device Version Base OS"),
            subtitle: Text(_deviceVersionBaseOs),
          ),
          ListTile(
            title: const Text("Device Version Codename"),
            subtitle: Text(_deviceVersionCodename),
          ),
          ListTile(
            title: const Text("Device Version Incremental"),
            subtitle: Text(_deviceVersionIncremental),
          ),
          ListTile(
            title: const Text("Device Version Preview SDK"),
            subtitle: Text(_deviceVersionPreviewSdk),
          ),
          ListTile(
            title: const Text("Device Version Release"),
            subtitle: Text(_deviceVersionRelease),
          ),
          ListTile(
            title: const Text("Device Version SDK"),
            subtitle: Text(_deviceVersionSdk),
          ),
          ListTile(
            title: const Text("Device Version Security Patch"),
            subtitle: Text(_deviceVersionSecurityPatch),
          ),
        ],
      ),
    );
  }
}