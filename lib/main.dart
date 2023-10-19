import 'package:flutter/material.dart';
import 'package:learning_app_a/kernel/widgets/navigation/menu.dart';
import 'package:learning_app_a/kernel/widgets/splash/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => const Splash(title: 'Cargando...'),
        '/menu':(context) => const Menu(),
      },
    );
  }
}



