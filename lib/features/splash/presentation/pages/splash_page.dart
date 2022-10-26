import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
        (value) => Navigator.pushReplacementNamed(context, HomePage.routeName));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MoveWindow(
      child: const Scaffold(
        body: Center(
          child: Hero(
            tag: "__splash-home__",
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ),
      ),
    );
  }
}
