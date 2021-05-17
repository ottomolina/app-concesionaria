import 'package:flutter/material.dart';

import 'package:app_concesionario/src/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        initialRoute: '/',
        routes: getApplicationRoutes());
  }
}
