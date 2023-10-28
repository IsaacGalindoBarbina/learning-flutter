import 'package:flutter/material.dart';
import 'package:learning_app_a/modules/auth/adapterts/screens/Account.dart';
import 'package:learning_app_a/modules/auth/adapterts/screens/login.dart';

class LoginStack extends StatelessWidget{
  const LoginStack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/login/account' : (context) => const Account()
      },
    );
  }

}