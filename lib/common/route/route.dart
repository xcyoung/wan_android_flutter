import 'package:flutter/material.dart';
import 'package:wan_android/moudle/browser/browser_page.dart';
import 'package:wan_android/moudle/page_export.dart';

class Path {
  static const String Home = '/wan/home';
  static const String Login = '/wan/login';
  static const String REGISTER = '/wan/register';
  static const String BROWSER = '/wan/browser';
}

class RouteCenter {
  factory RouteCenter() => _getInstance();

  static RouteCenter get instance => _getInstance();
  static RouteCenter _instance;

  RouteCenter._internal() {}

  static RouteCenter _getInstance() {
    if (_instance == null) {
      _instance = new RouteCenter._internal();
    }
    return _instance;
  }

  static final Map<String, Function> routes = {
    Path.Home: (context) => HomePage(),
    Path.Login: (context) => LoginPage(),
    Path.REGISTER: (context) => RegisterPage(),
  };

  final Route<dynamic> Function(RouteSettings settings) onGenerateRoute =
      (RouteSettings settings) {
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, settings.arguments));
        return route;
      } else {
        final route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
        return route;
      }
    } else {
      return null;
    }
  };

  void pop(context) {
    Navigator.pop(context);
  }

  void goToLogin(context) {
    Navigator.pushNamed(context, Path.Login);
  }

  void goToRegister(context) {
    Navigator.pushNamed(context, Path.REGISTER);
  }

  void goToHome(context) {
    Navigator.pushNamed(context, Path.Home);
  }

  void goToBrowser(context, url) {
//    Navigator.pushNamed(context, Path.BROWSER);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => BrowserPage(url)));
  }
}
