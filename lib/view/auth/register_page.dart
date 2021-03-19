import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/widgets/base_auth_page.dart';
import 'package:front/widgets/input.dart';
import 'package:front/widgets/button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseAuthPage(
        title: "Faça seu cadastro",
        subtitle:
            "Vamos pegar seus dados para fazer seu cadastro e conseguir entrar no app.",
        body: Column(
          children: [
            Input(
              type: TextInputType.visiblePassword,
              controller: _passwordController,
              placeholder: 'Nome',
              icon: Icons.person_outlined,
            ),
            Input(
              type: TextInputType.emailAddress,
              controller: _emailController,
              placeholder: 'E-mail',
              icon: Icons.mail_outline,
            ),
            Input(
              type: TextInputType.visiblePassword,
              controller: _passwordController,
              placeholder: 'WhatsApp',
              icon: Icons.phone,
            ),
            Input(
              type: TextInputType.visiblePassword,
              controller: _passwordController,
              placeholder: 'Senha',
              icon: Icons.lock_outline,
            ),
            Input(
              type: TextInputType.visiblePassword,
              controller: _passwordController,
              placeholder: 'Confirmar Senha',
              icon: Icons.lock_outline,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Button(
                title: 'Criar conta',
                onPressedHandler: () {
                  print(_emailController.text);
                  print(_passwordController.text);
                  showDialog(
                    context: context,
                    builder: (BuildContext ctx) => AlertDialog(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
