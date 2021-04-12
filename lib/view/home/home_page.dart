import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/session.model.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/widgets/base_page.dart';
import 'package:front/widgets/lend_card.dart';
import 'package:front/widgets/category_chip_list.dart';

import 'package:front/widgets/page_heading.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  LendController _lendController;
  CategoryModel _selectedCategory;

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
    final session = Provider.of<SessionModel>(context, listen: false);

    return Scaffold(
      body: BasePage(
        header: Container(
          padding: EdgeInsets.only(top: 28),
          child: PageHeading(
            title: "Boa tarde, ${session.user.name}",
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
              CategoryChipList(
                getSelectedCategory: (selectedCategory) {
                  setState(() {
                    _selectedCategory = selectedCategory;
                  });
                },
              ),
              SizedBox(height: 25),
              FutureBuilder(
                future: _lendController.getLends(
                  categoryId: _selectedCategory?.id,
                ),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<LendModel> lends = snapshot.data;

                    return Column(
                      children: lends
                          .map(
                            (lend) => LendCard(
                              lend: lend,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.SHOW_LEND,
                                  arguments: lend,
                                );
                              },
                              leading: "maia",
                              trailing: Icons.ac_unit,
                            ),
                          )
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    // TODO: Fazer uma tela de Retry bonita(lembrar da retry policy na gateway)
                    return Center(
                      child: Text(snapshot.error),
                    );
                  }
                  // TODO: Shimmer effect com LendCard dummy
                  return Center(child: CircularProgressIndicator());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
