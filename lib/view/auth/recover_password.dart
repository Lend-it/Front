import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/recover.controller.dart';
import 'package:front/widgets/base_auth_page.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';

class RecoverPassword extends StatefulWidget {
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  TextEditingController _emailController;
  RecoverController _recoverController = RecoverController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _recoverPassword() {
    print(_emailController.text);
    _recoverController.sendMail(
      _emailController.text,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseAuthPage(
        title: "Recuperação de senha",
        subtitle:
            "Para recuperar o acesso a sua conta, vamos enviar uma código para seu e-mail.",
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Input(
                prefix: Icons.mail_outline,
                placeholder: 'E-mail',
                type: TextInputType.emailAddress,
                controller: _emailController,
              ),
              Button(
                title: 'Solicitar nova senha',
                onPressedHandler: _recoverPassword,
              )
            ],
          ),
        ),
      ),
    );
  }
}
