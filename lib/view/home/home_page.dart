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
  TextEditingController _email;
  FocusNode _focusEmail;
  TextEditingController _password;
  FocusNode _focusPassword;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _focusEmail = FocusNode();
    _password = TextEditingController();
    _focusPassword = FocusNode();
  }

  @override
  void dispose() {
    _email.dispose();
    _focusEmail.dispose();
    _password.dispose();
    _focusPassword.dispose();
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
            controller: _email,
            placeholder: 'E-mail',
            icon: Icons.mail_outline,
            focusNode: _focusEmail,
          ),
          Input(
            type: TextInputType.visiblePassword,
            controller: _password,
            placeholder: 'Password',
            icon: Icons.lock_outline,
            focusNode: _focusPassword,
          ),
          Button(
            title: 'Placeholder',
            onPressed: () {
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
