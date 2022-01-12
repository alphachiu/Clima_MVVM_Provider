import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:clima_mvvm_provider/utils/route_paths.dart';
import 'package:clima_mvvm_provider/location_main/view/location_view.dart';
import 'package:clima_mvvm_provider/city_main/view/city_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.HOME:
        return MaterialPageRoute(builder: (_) => LocactionView());
      case RoutePaths.CITY:
        return MaterialPageRoute(builder: (_) => City_View());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('not find any pages：${settings.name}'),
                  ),
                ));
    }
  }
}
