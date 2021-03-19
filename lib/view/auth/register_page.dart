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
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _whatsappController;
  TextEditingController _passwordController;
  TextEditingController _passwordConfirmController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _whatsappController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _whatsappController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
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
              type: TextInputType.name,
              controller: _nameController,
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
              type: TextInputType.phone,
              controller: _whatsappController,
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
              controller: _passwordConfirmController,
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
