import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/widgets/base_page.dart';
import 'package:front/widgets/lend_card.dart';
import 'package:front/widgets/category_chip_list.dart';

import 'package:front/widgets/page_heading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  LendController _lendController;
  List<LendModel> lends = [];

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _lendController = LendController();
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
    final LendModel teste = LendModel(
      id: 'fce61c6d-1cb0-488c-a2fa-6a90fdbe192d',
      title: 'Furadeira',
      category: category,
      description:
          'Preciso furar as cortinas e os suportes da televisão do meu apartamento e gostaria emprestado! Alguém pode me ajudar?',
      endDate: "Sat, 21 Sep 2019 00:00:00 GMT",
      startDate: "Sat, 21 Sep 2019 00:00:00 GMT",
      user: user,
    );

    return Scaffold(
      body: BasePage(
        header: Container(
          padding: EdgeInsets.only(top: 20),
          child: PageHeading(
            title: "Boa tarde, Maia",
            subtitle: "Que dia lindo para ajudar alguém!",
            inverted: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pedidos de categoria",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              CategoryChipList(),
              SizedBox(height: 25),
              FutureBuilder(
                future: _lendController.getLends(),
                builder: (context, snapshot) {
                  return ListView.separated(
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
                        leading: "maia",
                        trailing: Icons.ac_unit,
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
