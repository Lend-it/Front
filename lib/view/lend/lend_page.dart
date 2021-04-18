import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/session.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:front/widgets/lend_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../routes/app_routes.dart';

class LendPage extends StatefulWidget {
  @override
  _LendPageState createState() => _LendPageState();
}

class _LendPageState extends State<LendPage> {
  LendController lendController = new LendController();
  List<LendModel> lends = [];

  @override
  void initState() {
    super.initState();
    getAllLends();
  }

  void getAllLends() async {
    final List<LendModel> response = await lendController.getLends();
    setState(() {
      lends = response;
    });
    print(response);
  }

  void _deleteRequest(String id, context) async {
    var response = await lendController.deleteLend(id);
    if (response.statusCode != 200) {
      NotificationPopup.notificate(
        context: context,
        title: 'Não foi possível realizar a ação',
        status: 'fail',
      );
    } else {
      NotificationPopup.notificate(
        context: context,
        title: 'Ação realizada com sucesso',
        status: 'success',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LendPage'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => SizedBox(height: 10),
        itemCount: lends.length,
        itemBuilder: (context, i) {
          return LendCard(
            lend: lends[i],
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.SHOW_LEND,
                arguments: lends[i],
              );
            },
          );
        },
      ),
    );
  }
}
