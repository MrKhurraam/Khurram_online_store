import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/services/cart_service.dart';
import 'src/services/category_selection_Service.dart';
import 'src/services/login_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => CartService()),
        ChangeNotifierProvider(create: (_) => CategorySelectionService()),
      ],
      child: const MyApp(),
    ),
  );
}
