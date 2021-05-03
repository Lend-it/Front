import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/session.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:front/widgets/category_chip_list.dart';
import 'package:front/widgets/lend_card.dart';
import 'package:provider/provider.dart';

import '../../routes/app_routes.dart';

class LendPage extends StatefulWidget {
  @override
  _LendPageState createState() => _LendPageState();
}

class _LendPageState extends State<LendPage> {
  LendController lendController = new LendController();
  List<LendModel> lends = [];
  LendController _lendController;
  CategoryModel _selectedCategory;

  @override
  void initState() {
    super.initState();
    _lendController = LendController();
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
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final session = Provider.of<SessionModel>(context, listen: false);

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
                        FutureBuilder(
                          future: _lendController.getLends(
                            categoryId: _selectedCategory?.id,
                            useremail: session.user.email,
                            isRequester: true,
                            isLender: false,
                          ),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
                        FutureBuilder(
                          future: _lendController.getLends(
                            categoryId: _selectedCategory?.id,
                            useremail: session.user.email,
                            isRequester: false,
                            isLender: true,
                          ),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
