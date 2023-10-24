import 'package:flutter/material.dart';
import 'package:learning_app_a/kernel/theme/colors_app.dart';
import 'package:learning_app_a/kernel/widgets/custom/custom_carousel.dart';

class News extends StatelessWidget{
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,
        title:  const Text('Noticias'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        child: const CustomCarousel( carouselHeight: 300,itemList: [FirstSection(), SecondSection(), ThirdSection()]),
      ),
    );
  }
}

class FirstSection extends StatelessWidget{
  const FirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    double widthImage = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/logo.png', width: widthImage, height: 120,fit: BoxFit.fitWidth,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Align(
              alignment: Alignment.topLeft, 
              child: Text('regresa el aire acondicionado', style: TextStyle(fontWeight: FontWeight.bold),),),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Align(
              alignment: Alignment.topLeft, 
              child: Text('por fin llega territorio de calidad'),),
          )
        ],
      ),
    );
  }
}
class SecondSection extends StatelessWidget{
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    double widthImage = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/auditoria.png', width: widthImage, height: 120,fit: BoxFit.fitWidth
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Align(
              alignment: Alignment.topLeft, 
              child: Text('utez y sus auditoria', style: TextStyle(fontWeight: FontWeight.bold),),),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Align(
              alignment: Alignment.topLeft, 
              child: Text('Concluyen con exito las auditorias externas al territorio de calidad'),),
          )
        ],
      ),
    );
  }
}
class ThirdSection extends StatelessWidget{
  const ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    double widthImage = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/innovacion.png', width: widthImage, height: 120,fit: BoxFit.fitWidth,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Align(
              alignment: Alignment.topLeft, 
              child: Text('ya regresen po favo', style: TextStyle(fontWeight: FontWeight.bold),),),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Align(
              alignment: Alignment.topLeft, 
              child: Text('adacedi aiudaaaa'),),
          )
        ],
      ),
    );
  }
}