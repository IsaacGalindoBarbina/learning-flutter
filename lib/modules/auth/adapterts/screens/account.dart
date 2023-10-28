import 'package:flutter/material.dart';
import 'package:learning_app_a/modules/auth/adapterts/screens/widgets/first_acount.dart';

class Account extends StatelessWidget{
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FirstAccount(),
    );
  }

}