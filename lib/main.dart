import 'package:darazapp/ApiProduct.dart';
import 'package:darazapp/Signup.dart';
import 'package:darazapp/homepage.dart';
import 'package:darazapp/login.dart';
import 'package:darazapp/splashscreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      // home: const Homepage(),
      // home: const Login(),
      home: const Splashscreen(),
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/home': (context) => const Homepage(),
        '/product': (context) => const ApiProduct(),
      },
      // home: const Signup(),
    );
  }
}
