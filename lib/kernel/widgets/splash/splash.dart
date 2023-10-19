// import 'dart:ffi';
// import 'dart:js';

// import 'package:flutter/material.dart';

// class Splash extends StatefulWidget{
//   final String title;
//   const Splash({super.key, required this.title, required Function(dynamic context) });

//   @override
//   void initState(){
//     super.initState();
//     Future.delayed(const Duration(seconds: 4), ()=> Navigator.pushReplacementNamed(context, '/menu'));
//   }
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget> [
//           Image.asset('assets/images/logo.png', 
//         width: 200, 
//         height: 150,),
//         Text('$title')
//         ]),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  final String title;
  const Splash({super.key, required this.title});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), 
    () => Navigator.pushReplacementNamed(context, '/menu'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image.asset('assets/images/logo.png', 
            width: 200, 
            height: 150,), 
             Text('${widget.title}')
          ]),
          ),
    );
  }
}