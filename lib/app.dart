import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

class WordpressCafeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePage',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: ThemeData(
        brightness: Brightness.light,
        // primarySwatch: Colors.deepOrange,
        // accentColor: Colors.deepPurple,
      ),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}
