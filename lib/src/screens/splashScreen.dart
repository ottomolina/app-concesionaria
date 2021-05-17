import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static final pageName = '/';
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), _onShowLogin);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onShowLogin() {
    if (mounted) {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(height: 150.0),
            Image.asset('assets/splashscreen.png'),
            Text(
              'Bienvenido',
              style: TextStyle(
                color: Color(0xFF014474),
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            Flexible(
              flex: 2,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 64.0, horizontal: 16.0),
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
