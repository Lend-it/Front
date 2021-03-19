import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/widgets/base_auth_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseAuthPage(
        title: "Titulo da pagina",
        subtitle: "Subtitulo da pagina",
        body: Text('body'),
      ),
    );
  }
}
