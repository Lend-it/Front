import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PROFILE_PAGE);
            },
            child: Text('Ir para Perfil'),
            color: Colors.blue,
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
            placeholder: 'Password',
            icon: Icons.lock_outline,
          ),
          Button(
            title: 'Placeholder',
            onPressedHandler: () {
              print(_emailController.text);
              print(_passwordController.text);
              showDialog(
                context: context,
                builder: (BuildContext ctx) => AlertDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
