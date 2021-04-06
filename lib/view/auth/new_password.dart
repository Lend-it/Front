import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/widgets/base_auth_page.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _passwordConfirmController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
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
                controller: _passwordController,
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
                controller: _passwordController,
                isPassword: true,
              ),
              SizedBox(height: 10),
              Button(
                title: 'Salvar',
                onPressedHandler: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
