import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
          Navigator.of(context).pushNamed('/home/about');
        },
        child: const Text('Ir a acerca de nosotros')),
    ));
  }

}