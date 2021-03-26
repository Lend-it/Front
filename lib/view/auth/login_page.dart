import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/controller/session.controller.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/theme/colors.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  SessionController _sessionController = SessionController();

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

  void _createSession() {
    _sessionController.createSession(
      _emailController.text,
      _passwordController.text,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: statusBarHeight,
              right: -50,
              child: SvgPicture.asset(
                'assets/logo_water_mark.svg',
                width: 200,
                color: primaryColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 84),
                        child: SvgPicture.asset(
                          'assets/logo_white_background.svg',
                          width: 180,
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          "Vamos ajudar um vizinho hoje?",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45),
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bem vindo ao Lend.it",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColor,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "Insira seus dados para fazer o login e começar a ajudar seus vizinhos!",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: lightColor,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 30),
                            Input(
                              type: TextInputType.emailAddress,
                              controller: _emailController,
                              placeholder: 'E-mail',
                              prefix: Icons.mail_outline,
                            ),
                            Input(
                              type: TextInputType.visiblePassword,
                              controller: _passwordController,
                              placeholder: 'Senha',
                              prefix: Icons.lock_outline,
                              isPassword: true,
                            ),
                            Text(
                              "Esqueceu sua senha? Recupere aqui",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: lightColor,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 15),
                            Button(
                              title: "Entrar",
                              onPressedHandler: () {
                                _createSession();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Divider(
                        height: 45,
                        thickness: 2,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.REGISTER_PAGE,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15),
                            child: Text(
                              'Não tem uma conta? Crie sua conta aqui',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: lightColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
