import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getting_version_app/pages/device_country_page.dart';
import 'package:getting_version_app/pages/home_page.dart';
import 'package:getting_version_app/pages/login_signin/get_started.dart';
import 'package:getting_version_app/pages/login_signin/login_page.dart';
import 'package:getting_version_app/pages/login_signin/sign_in.dart';
import 'package:getting_version_app/pages/version_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        VersionPage.id: (context) => VersionPage(),
        DeviceCountryPage.id: (context) => DeviceCountryPage(),
        LoginPage.id: (context) => LoginPage(),
        GetStartedPage.id: (context) => GetStartedPage(),
        SignInPage.id: (context) => SignInPage()
      },
    );
  }
}
