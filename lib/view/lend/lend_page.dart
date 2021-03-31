import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:front/widgets/base_page.dart';
import 'package:front/widgets/category_chip_list.dart';
import 'package:front/widgets/lend_card.dart';
import 'package:intl/intl.dart';

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
      endDate: "Sat, 21 Sep 2019 00:00:00 GMT",
      startDate: "Sat, 21 Sep 2019 00:00:00 GMT",
      user: user,
    );

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Container(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: 100,
            backgroundColor: primaryColor,
            elevation: 0,
            title: Stack(
              children: [
                Positioned(
                  top: statusBarHeight,
                  right: -25,
                  child: SvgPicture.asset(
                    'assets/logo_water_mark.svg',
                    width: 100,
                  ),
                ),
                Container(
                  height: 160,
                  width: size.width,
                  child: TabBar(
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Tab(
                        child: Text(
                          "Meus pedidos",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Emprestados",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pedidos que você criou",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CategoryChipList(),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            LendCard(
                              lend: lend,
                              trailing: Icons.favorite_border,
                              leading: 'Emprestar',
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            LendCard(
                              lend: lend,
                              trailing: Icons.favorite_border,
                              leading: 'Emprestar',
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            LendCard(
                              lend: lend,
                              trailing: Icons.favorite_border,
                              leading: 'Emprestar',
                              onPressed: () {},
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            LendCard(
                              lend: lend,
                              trailing: Icons.favorite_border,
                              leading: 'Emprestar',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Produtos que você emprestou",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            LendCard(
                              lend: lend,
                              trailing: Icons.favorite_border,
                              leading: 'Emprestar',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
