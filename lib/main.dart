import 'package:bite_sprint/router/app_router.dart';
import 'package:bite_sprint/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bite Sprint',
      theme: ThemeData(
        // primaryColor: ColorScheme.,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFf15701)),

        useMaterial3: false,
      ),
      routerConfig: AppRouter().router,
      debugShowCheckedModeBanner: false,
    );
  }
}
