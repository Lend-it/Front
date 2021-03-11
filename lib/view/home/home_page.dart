import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';

class HomePage extends StatelessWidget {
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
            placeholder: 'Placeholder',
            icon: Icons.mail,
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
