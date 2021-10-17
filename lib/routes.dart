import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/splash.dart';

import 'filters.dart';
import 'home.dart';
import 'list_home.dart';
import 'map_home.dart';


class RouteGenerator {

  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
print(settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const Splash());
      case 'list_home':
        return MaterialPageRoute(builder: (context) => const listHome());
      case 'mapHome':
        return MaterialPageRoute(builder: (context) => mapHome());
      case 'HomePage':
        return MaterialPageRoute(builder: (context) => const HomePage());
      case 'Filters':
        return MaterialPageRoute(builder: (context) => Filters());
      case 'SavedPage':
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:  return MaterialPageRoute(builder: (context) => const Splash());
    }

  }
}
