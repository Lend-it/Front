import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/recover.controller.dart';
import 'package:front/widgets/base_auth_page.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController _tokenController;
  TextEditingController _passwordController;
  TextEditingController _passwordConfirmController;
  RecoverController _recoverController = RecoverController();

  @override
  void initState() {
    super.initState();
    _tokenController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    _tokenController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    _recoverController.resetPassword(
      _tokenController.text,
      _passwordController.text,
      _passwordConfirmController.text,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseAuthPage(
        title: "Nova senha",
        subtitle:
            "Deseja criar uma nova senha? Insira sua nova senha e confirme-a.",
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Input(
                prefix: Icons.lock_outline,
                placeholder: 'Código do E-mail',
                type: TextInputType.emailAddress,
                controller: _tokenController,
                isPassword: true,
              ),
              Input(
                prefix: Icons.lock_outline,
                placeholder: 'Nova Senha',
                type: TextInputType.emailAddress,
                controller: _passwordController,
                isPassword: true,
              ),
              Input(
                prefix: Icons.lock_outline,
                placeholder: 'Repetir Nova Senha',
                type: TextInputType.emailAddress,
                controller: _passwordConfirmController,
                isPassword: true,
              ),
              SizedBox(height: 10),
              Button(
                title: 'Salvar',
                onPressedHandler: _resetPassword,
              )
            ],
          ),
        ),
      ),
    );
  }
}
