import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/user.controller.dart';
import 'package:front/model/user.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/widgets/base_auth_page.dart';
import 'package:front/widgets/input.dart';
import 'package:front/widgets/button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

  void _createUser(BuildContext context) {
    final LatLng selectedCoords = ModalRoute.of(context).settings.arguments;

    final UserModel user = new UserModel(
      name: _nameController.text,
      email: _emailController.text,
      whatsapp: _whatsappController.text,
      password: _passwordController.text,
      latitude: selectedCoords.latitude,
      longitude: selectedCoords.longitude,
    );

    new UserController().createNewUser(user, context);
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
                prefix: Icons.person_outlined,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.emailAddress,
                controller: _emailController,
                placeholder: 'E-mail',
                prefix: Icons.mail_outline,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.phone,
                controller: _whatsappController,
                placeholder: 'WhatsApp',
                prefix: Icons.phone,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.visiblePassword,
                controller: _passwordController,
                placeholder: 'Senha',
                prefix: Icons.lock_outline,
                isPassword: true,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Input(
                type: TextInputType.visiblePassword,
                controller: _passwordConfirmController,
                placeholder: 'Confirmar Senha',
                prefix: Icons.lock_outline,
                isPassword: true,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Button(
                title: 'Criar conta',
                onPressedHandler: () {
                  _createUser(context);
                },
              ),
            ),
            SizedBox(height: 12),
            Divider(height: 45, thickness: 2),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Voltar para Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: secondaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
