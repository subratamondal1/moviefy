// Models
import 'dart:convert';

// Packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:moviefy/models/app_config.dart';

//Services
import 'package:moviefy/services/http_service.dart';
import 'package:moviefy/services/movie_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.onInitializationComplete})
      : super(key: key);

  final VoidCallback onInitializationComplete;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _setUp(context).then(
      (_) => widget.onInitializationComplete(),
    );
  }

  // This _setUp function will be responsible for loading all the data from the json file and make
  // it ready globally accessible for all the other classes that needs it all this will be done when
  //our app is in the initialize state i.e when our splash screen will be visible. Othe json file other
  //Http files will also be loaded. All these processes will be asynchronous
  Future<void> _setUp(BuildContext context) async {
    //The GetIt.instance this will allow us to register Singleton for different classes that we have inside
    //our application and make them available to us. Singleton is just one instance of a class that is globally
    //accessible and the same everywhere
    final getIt = GetIt.instance;
    //rootBundle.load('assets/config/main.json') this will help to access our system's storage
    final configFile = await rootBundle.loadString('assets/config/main.json');
    // To get the json data out from the above file main.json
    final configData = jsonDecode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
        API_KEY: configData['API_KEY'],
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL']));

    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );
    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moviefy',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Colors.blue,
                Colors.blue.shade200,
                Colors.blue.shade400,
                Colors.blue.shade600,
                Colors.blue.shade800,
                Colors.blue.shade900,
              ],
            ),
          ),
          child: Center(
            child: Text(
              'moviefy',
              style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.0,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
