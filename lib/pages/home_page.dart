import 'package:getting_version_app/pages/login_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:getting_version_app/pages/device_country_page.dart';
import 'package:getting_version_app/pages/version_page.dart';
import 'package:shake/shake.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: (){
      Navigator.pushNamed(context, DeviceCountryPage.id);
    });
    _askPermissions(null);
  }


  Future<void> _askPermissions(String? routeName) async {
    PermissionStatus permissionStatus = await _getLocationPermission();
    if (permissionStatus == PermissionStatus.granted) {
      if (routeName != null) {
        Navigator.of(context).pushNamed(routeName);
      }
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getLocationPermission() async {
    PermissionStatus permission = await Permission.locationWhenInUse.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.locationWhenInUse.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      const snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      const snackBar =
      SnackBar(content: Text('Location data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              shape: StadiumBorder(),
              height: 40,
              minWidth: 200,
              color: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, VersionPage.id);
              }, child: Text("App Version", style: TextStyle(fontSize: 20, color: Colors.white),),),
            MaterialButton(
              shape: StadiumBorder(),
              height: 40,
              minWidth: 200,
              color: Colors.blue,
              onPressed: (){
                _askPermissions(DeviceCountryPage.id);
              }, child: Text("Device Country", style: TextStyle(fontSize: 20, color: Colors.white),),),
            MaterialButton(
              shape: StadiumBorder(),
              height: 40,
              minWidth: 200,
              color: Colors.blue,
              onPressed: (){
                _askPermissions(LoginPage.id);
              }, child: Text("Login Page", style: TextStyle(fontSize: 20, color: Colors.white),),),
          ],
        ),
      ),
    );
  }
}
