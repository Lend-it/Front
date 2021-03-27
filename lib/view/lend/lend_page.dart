import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:front/widgets/lendCard.dart';
import 'package:intl/intl.dart';

class LendPage extends StatelessWidget {
  final NotificationPopup notificationPopup = new NotificationPopup();
  final LendController lendController = new LendController();

  void _deleteRequest(String id, context) async {
    var response = await lendController.deleteLend(id);
    if (response.statusCode != 200) {
      notificationPopup.notificate(
        context: context,
        title: 'Não foi possível realizar a ação',
        status: 'fail',
      );
    } else {
      notificationPopup.notificate(
        context: context,
        title: 'Ação realizada com sucesso',
        status: 'success',
      );
    }
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
      title: 'Jogos',
    );
    final LendModel lend = LendModel(
      id: '3',
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
            trailing: Icons.delete,
            leading: 'Deletar',
            onPressed: () {
              _deleteRequest('9406ab9c-a0e2-4ec3-8779-a45ec7788f7c', context);
            },
          ),
        ],
      ),
    );
  }
}
