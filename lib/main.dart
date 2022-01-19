import 'package:flutter/material.dart';
import 'package:getting_version_app/pages/device_country_page.dart';
import 'package:getting_version_app/pages/home_page.dart';
import 'package:getting_version_app/pages/login_page.dart';
import 'package:getting_version_app/pages/version_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        LoginPage.id: (context) => LoginPage()
      },
    );
  }
}