import 'package:flutter/material.dart';
import 'package:khurram_store/src/services/login_service.dart';
import 'package:provider/provider.dart';
import 'pages/details_page.dart';
import 'pages/map_page.dart';
import 'pages/on_boarding_page.dart';
import 'pages/selected_category_page.dart';
import 'services/cart_service.dart';
import 'extras/testInsertion.dart';
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
        // '/': (context) => TestInsertion(),
        '/': (context) => SplashPage(duration: 2, goToPage: '/welcomepage'),
        '/welcomepage': (context) => WelcomePage(),
        '/testinsertion': (context) => TestInsertion(),
        '/mainpage': (context) => MainPage(),
        '/selectedcategorypage': (context) {
          return SelectedCategoryPage();
        },
        '/detailspage': (context) => DetailsPage(),
        '/mappage': (context) => MapPage(),
        '/onboardingpage': (context) => OnBoardingPage(),
      },
    );
  }
}
