import 'package:flutter/material.dart';
import 'package:learning_app_a/modules/news/adapters/screens/news.dart';

class NewsStack extends StatelessWidget{
  const NewsStack({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/news',
      routes: {
        '/news': (context) => const News()
      },
    );
  }

}