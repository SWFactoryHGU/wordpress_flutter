import 'package:flutter/material.dart';

// import 'Login.dart';
import 'home.dart';

class WordpressCafeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordpress Cafe',
      home: HomePage(),
      // initialRoute: '/login',
      // onGenerateRoute: _getRoute,
    );
  }

  // Route<dynamic> _getRoute(RouteSettings settings) {
  //   if (settings.name != '/login') {
  //     return null;
  //   }
  //   return MaterialPageRoute<void>(
  //     settings: settings,
  //     builder: (BuildContext context) => LoginPage(),
  //     fullscreenDialog: true,
  //   );
  // }
}
