import 'package:flutter/material.dart';
import 'package:learning_app_a/kernel/theme/colors_app.dart';
import 'package:learning_app_a/kernel/validations/validation_app.dart';

class FirstForm extends StatefulWidget {
  const FirstForm({super.key});

  @override
  State<FirstForm> createState() => _FirstFormState();
}

class _FirstFormState extends State<FirstForm> {
  final _formKey = GlobalKey<FormState>();
  var _isButtonDisabled = true;
  final TextEditingController _fullName = TextEditingController(text: '');
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _age = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('creacion de cuenta')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 16),
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 300,
                  height: 100,
                )),
            Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  _isButtonDisabled = !_formKey.currentState!.validate();
                });
              },
              child: Column(
                children: <Container>[
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Nombre completo:*'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obligario';
                        } else {
                          return null;
                        }
                      },
                      controller: _fullName,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Correo electronico:*'),
                      validator: (value) {
                        RegExp regex = RegExp(ValidationEmail.email);
                        if (value == null || value.isEmpty) {
                          return 'campo obligatorio';
                        } else if (!regex.hasMatch(value)) {
                          return 'Introduce un correo válido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'edad:*'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obligario';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: _age,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            backgroundColor: ColorsApp.successColor),
                        onPressed: _isButtonDisabled
                            ? null
                            : () {
                                print('$_fullName $_email $_age');
                              },
                        child: const Text('Crear cuenta')),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
