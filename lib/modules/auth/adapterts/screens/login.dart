import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_app_a/kernel/theme/colors_app.dart';
import 'package:learning_app_a/kernel/validations/validation_app.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginFormState();
}

class _LoginFormState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var _isButtonDisabled = true;
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password = TextEditingController(text: '');
  final dio = Dio();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Image.asset(
                'assets/images/logo_crochet.png',
                width: 450,
                height: 250,
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              color: ColorsApp.basedColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              child: Form(
                key: _formKey,
                onChanged: () {
                  setState(() {
                    _isButtonDisabled = !_formKey.currentState!.validate();
                  });
                },
                child: Column(
                  children: <Widget>[
                    //podria quitar el widget, verificar
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        // child: TextButton(
                        //   style: TextButton.styleFrom(
                        //     padding: const EdgeInsets.all(16.0),
                        //     textStyle: const TextStyle(fontSize: 18)),
                        //   onPressed: (){
                        //     Navigator.of(context).pushNamed('/login/account');
                        //   },
                        //   child: const Text('Crear una cuenta'),
                        // ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login/account');
                            },
                            child: const Text('Crear una cuenta'),)),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Correo Electronico:'),
                        validator: (value) {
                          RegExp regex = RegExp(ValidationEmail.email);
                          if (value == null || value.isEmpty) {
                            return 'Campo obligario';
                          } else if (!regex.hasMatch(value)) {
                            return 'Email no valido';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Contraseña:'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo obligario';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        controller: _password,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(300, 50),
                              backgroundColor: ColorsApp.successColor),
                          onPressed: _isButtonDisabled
                              ? null
                              : () {
                                  print('$_email $_password');
                                  request();
                                },
                          child: const Text('Iniciar Sesion')),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 void request() async{
    Response response;
    response = await dio.post('http://192.168.137.1:3000/api/auth/login', data: { "usuario":_email.value.text,"contrasena" : _password.value.text }
    );
    print("aDECIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII");
    print(response.data.toString());
  }

}
