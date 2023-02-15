import 'package:flutter/material.dart';
import 'package:khurram_store/src/pages/details_page.dart';
import 'package:khurram_store/src/pages/map_page.dart';
import 'package:khurram_store/src/pages/on_boarding_page.dart';
import 'package:khurram_store/src/pages/selected_category_page.dart';

import 'helpers/utils.dart';
import 'pages/main_page.dart';
import 'pages/splash_page.dart';
import 'pages/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Raleway'),
      debugShowCheckedModeBanner: false,
      navigatorKey: Utils.mainAppNav,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(duration: 3, goToPage: WelcomePage()),
        '/welcomepage': (context) => WelcomePage(),
        '/mainpage': (context) => MainPage(),
        '/selectedcategorypage': (context) => SelectedCategoryPage(),
        '/detailspage': (context) => DetailsPage(),
        '/mappage': (context) => MapPage(),
        '/onboardingpage': (context) => OnBoardingPage(),
      },
    );
  }
}
