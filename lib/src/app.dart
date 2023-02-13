import 'package:flutter/material.dart';

import 'helpers/utils.dart';
import 'pages/splash_page.dart';
import 'pages/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      home: // MapPage()
      SplashPage(duration: 3, goToPage: WelcomePage()),
    );
  }
}
