import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/widgets/lendCard.dart';
import 'package:intl/intl.dart';

class LendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel(
      id: 3,
      name: 'José da Silva',
      rating: '4.0',
      photo:
          'https://avatars.githubusercontent.com/u/42722634?s=460&u=5dc66aaf59dbaf2e3e68c931cca641a44b5fd9fc&v=4',
    );
    final CategoryModel category = CategoryModel(
      id: 3,
      title: 'Jogos',
    );
    final LendModel lend = LendModel(
      id: 3,
      title: 'Banco Imobiliário',
      category: category,
      description:
          'Queria um banco imobiliário emprestado para jogar com meus amigos neste fim de semana!',
      endDate: DateFormat("dd/MM").format(DateTime.parse("2020-09-30")),
      startDate: DateFormat("dd/MM").format(DateTime.parse("2020-09-12")),
      user: user,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('LendPage'),
      ),
      body: Column(
        children: [
          LendCard(
            lend: lend,
            trailing: Icons.favorite_border,
            leading: 'Emprestar',
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
