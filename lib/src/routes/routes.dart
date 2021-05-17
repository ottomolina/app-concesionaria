import 'package:app_concesionario/src/pages/cliente/clientePage.dart';
import 'package:app_concesionario/src/pages/cliente/formClientePage.dart';
import 'package:app_concesionario/src/pages/cotizacion/cotizacionPage.dart';
import 'package:app_concesionario/src/pages/cotizacion/detalleCotizacionPage.dart';
import 'package:app_concesionario/src/pages/cotizacion/listaCotizacionPage.dart';
import 'package:app_concesionario/src/pages/cotizacion/newCotizacionPage.dart';
import 'package:app_concesionario/src/pages/homePage.dart';
import 'package:app_concesionario/src/pages/loginPage.dart';
import 'package:app_concesionario/src/pages/vehiculoPage.dart';
import 'package:app_concesionario/src/screens/splashScreen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    SplashScreen.pageName: (BuildContext context) => SplashScreen(),
    LoginPage.pageName: (BuildContext context) => LoginPage(),
    HomePage.pageName: (BuildContext context) => HomePage(),
    CotizacionPage.pageName: (BuildContext context) => CotizacionPage(),
    ListaCotizacionPage.pageName: (BuildContext context) =>
        ListaCotizacionPage(),
    NewCotizacionPage.pageName: (BuildContext context) => NewCotizacionPage(),
    DetalleCotizacionPage.pageName: (BuildContext context) =>
        DetalleCotizacionPage(),
    VehiculoPage.pageName: (BuildContext context) => VehiculoPage(),
    ClientePage.pageName: (BuildContext context) => ClientePage(),
    FormClientePage.pageName: (BuildContext context) => FormClientePage(),
  };
}
