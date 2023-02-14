import 'package:flutter/material.dart';
import 'package:khurram_store/src/services/category_selection_Service.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/services/login_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => CategorySelectionService()),
      ],
      child: const MyApp(),
    ),
  );
}
