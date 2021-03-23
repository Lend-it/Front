import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/routes/app_routes.dart';

class NoticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.LOGIN_PAGE,
              );
            },
            child: Text('Criar Lend'),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
