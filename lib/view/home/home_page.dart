import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/session.controller.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/view/auth/register_page.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/view/lend/create_lend.dart';
import 'package:front/widgets/notification_tile.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/category_chip_list.dart';

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
    final UserModel user = UserModel(
      id: '3',
      name: 'José da Silva',
      email: 'jose@email.com',
      rating: '4.0',
      photo:
          'https://avatars.githubusercontent.com/u/42722634?s=460&u=5dc66aaf59dbaf2e3e68c931cca641a44b5fd9fc&v=4',
    );
    final CategoryModel category = CategoryModel(
      id: '3',
      title: 'Ferramentas',
    );
    final LendModel lend = LendModel(
      id: 'fce61c6d-1cb0-488c-a2fa-6a90fdbe192d',
      title: 'Furadeira',
      category: category,
      description:
          'Preciso furar as cortinas e os suportes da televisão do meu apartamento e gostaria emprestado! Alguém pode me ajudar?',
      endDate: "2020-09-30",
      startDate: "2020-09-12",
      requester: user,
      lender: null,
      finalized: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: Text('Ir para Login'),
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.GEOLOCATION_PAGE,
              );
            },
            child: Text('Fluxo de Registro'),
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              new SessionController().cleanToken(context);
            },
            child: Text('Logout'),
            color: Colors.red,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateLend(
                    lend: lend,
                    isEdit: true,
                  ),
                ),
              );
            },
            child: Text('Editar pedido'),
            color: Colors.blue,
          ),
          CategoryChipList(),
          Input(
            type: TextInputType.emailAddress,
            controller: _emailController,
            placeholder: 'E-mail',
            prefix: Icons.mail_outline,
          ),
          Input(
            type: TextInputType.visiblePassword,
            controller: _passwordController,
            placeholder: 'Password',
            prefix: Icons.lock_outline,
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
          NotificationTile(
            title: "José da silva solicitou um banco imobiliario emprestado",
            subtitle: "12 min",
            onTapHandler: () {},
          ),
        ],
      ),
    );
  }
}
