import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/theme/colors.dart';
import 'package:front/view/home/home_page.dart';
import 'package:front/widgets/base_auth_page.dart';
import 'package:front/widgets/input.dart';
import 'package:front/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.name,
                controller: _nameController,
                placeholder: 'Nome',
                icon: Icons.person_outlined,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.emailAddress,
                controller: _emailController,
                placeholder: 'E-mail',
                icon: Icons.mail_outline,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.phone,
                controller: _whatsappController,
                placeholder: 'WhatsApp',
                icon: Icons.phone,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.visiblePassword,
                controller: _passwordController,
                placeholder: 'Senha',
                icon: Icons.lock_outline,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.visiblePassword,
                controller: _passwordConfirmController,
                placeholder: 'Confirmar Senha',
                icon: Icons.lock_outline,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
            ),
            SizedBox(height: 20),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 7),
            Container(
              child: GestureDetector(
                child: Text(
                  'Voltar para Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: secondaryColor,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.pop(
                    context,
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
