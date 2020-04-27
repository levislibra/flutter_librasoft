import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatelessWidget {

  Widget renderEmailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Usuario o Correo electronico',
            ),
          ),
      );
  }

  Widget renderPasswordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
      );
  }

  Widget renderLoginButton() {
    return Container(
      padding: const EdgeInsets.only(top:20),
      child: RaisedButton(
        onPressed: null,
        disabledColor: Color.fromARGB(255, 59,89,152),
        disabledTextColor: Colors.white,
        child: Text('Iniciar Sesion', ),
      ),
    );
  }

  Widget renderCreateAccount() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'O create tu cuenta aqui!',
        textAlign: TextAlign.right,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget renderDivisor() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(children: [
        Expanded(child: Divider(height: 2)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('0')),
        Expanded(child: Divider(height: 2)),
      ]),
    );
  }


  Widget renderFacebookButton() {
    return Container(
      padding: const EdgeInsets.only(top:20),
      child: FacebookSignInButton(onPressed: () {
        // call authentication logic
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 100),
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(children: [
          Image.asset(
            'assets/images/logo.png',
            width: 200,
          ),
          renderEmailInput(),
          renderPasswordInput(),
          renderLoginButton(),
          renderCreateAccount(),
          renderDivisor(),
          renderFacebookButton(),
        ]),
      )
    );
  }
}