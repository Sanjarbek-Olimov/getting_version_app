import 'package:flutter/material.dart';
import 'package:new_version/new_version.dart';

class VersionPage extends StatefulWidget {
  static const String id = "version_page";

  const VersionPage({Key? key}) : super(key: key);

  @override
  _VersionPageState createState() => _VersionPageState();
}

class _VersionPageState extends State<VersionPage> {
  late String version = "";
  late String storeVersion = "";

  Future<void> _version() async {
    final status = await NewVersion(
      // iOSId: 'com.google.Vespa',
      androidId: 'net.giosis.shopping.sg',
    ).getVersionStatus();
    setState(() {
      storeVersion = status!.storeVersion;
      version = status.localVersion;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _version();
    super.initState();
  }

  bool _checkVersions() {
    List localVersion = version.split(".");
    List storeversion = storeVersion.split(".");
    for (int i = 0; i < localVersion.length - 1; i++) {
      if (localVersion[i] != storeversion[i]) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            title: const Text(
              "Phone Version",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              version,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            title: const Text(
              "Store Version",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              storeVersion,
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              _checkVersions() ? "Open" : "Update",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
