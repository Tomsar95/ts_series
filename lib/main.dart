import 'package:flutter/material.dart';
import 'package:tv_series/features/core/utils/custom_navigator.dart';
import 'package:tv_series/features/core/utils/custom_colors.dart';
import 'package:tv_series/features/login/presentation/pages/login_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Series',
      theme: ThemeData(primaryColor: CustomColors.black),
      home: const LoginScreen(),
      onGenerateRoute: CustomNavigator.routes,
      onUnknownRoute: (_) => defaultRoute(const LoginScreen()),
    );
  }
}

