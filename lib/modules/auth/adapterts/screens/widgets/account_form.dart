import 'package:flutter/material.dart';
import 'package:learning_app_a/kernel/theme/colors_app.dart';
import 'package:learning_app_a/kernel/validations/validation_app.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key});
  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _formKey = GlobalKey<FormState>();
  var _isButtonDisabled = true;
  final TextEditingController _email = TextEditingController(text: '');
  final TextEditingController _password= TextEditingController(text: '');
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
                  'assets/images/logo-crochet.png',
                  width: 300,
                  height: 100,
                )
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
                        decoration: const InputDecoration(
                            labelText: 'Contraseña:'),
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
}