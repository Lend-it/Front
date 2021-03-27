import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/widgets/lendCard.dart';
import 'package:intl/intl.dart';

import '../../routes/app_routes.dart';

class LendPage extends StatefulWidget {
  @override
  _LendPageState createState() => _LendPageState();
}

class _LendPageState extends State<LendPage> {
  LendController lendController = new LendController();
  List<LendModel> lends = [];

  void getAllLends() async {
    final List<LendModel> response = await lendController.getLends();
    setState(() {
      lends = response;
    });
    print(response);
  }

  @override
  void initState() {
    super.initState();
    getAllLends();
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
            trailing: Icons.favorite_border,
            leading: 'Emprestar',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.SHOW_LEND);
            },
          );
        },
      ),
    );
  }
}
