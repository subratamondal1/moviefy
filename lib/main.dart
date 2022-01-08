import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviefy/views/pages/main_page.dart';
import 'package:moviefy/views/pages/splash_page.dart';

void main() {
  runApp(SplashPage(onInitializationComplete: () {
    return runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': ((context) => MainPage()),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
