import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clima_mvvm_provider/utils/route_paths.dart';
import 'package:clima_mvvm_provider/utils/router.dart' as routers;
import 'package:clima_mvvm_provider/utils/providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: ThemeData.dark(),
        initialRoute: RoutePaths.HOME,
        onGenerateRoute: routers.Router.generateRoute,
      ),
    );
  }
}
