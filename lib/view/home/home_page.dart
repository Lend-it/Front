import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/lendCard.dart';
import 'package:intl/intl.dart';

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
          Button(
            title: 'Placeholder',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext ctx) => AlertDialog(),
              );
            },
          ),
          LendCard(
            category: 'Jogos',
            description:
                'Queria um banco imobiliário emprestado para jogar com meus amigos neste fim de semana!',
            endDate: DateFormat("dd/MM").format(DateTime.parse("2020-09-30")),
            startDate: DateFormat("dd/MM").format(DateTime.parse("2020-09-12")),
            profilePic:
                'https://avatars.githubusercontent.com/u/42722634?s=460&u=5dc66aaf59dbaf2e3e68c931cca641a44b5fd9fc&v=4',
            userName: 'José da Silva',
            title: 'Banco Imobiliário',
            userRating: '4.2',
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext ctx) => AlertDialog(),
              );
            },
          )
        ],
      ),
    );
  }
}
