import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/dates.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/colors.dart';
import '../../widgets/button.dart';

Widget modalButton({
  String title,
  Color color,
  Color textColor,
  Function onPressed,
}) {
  return ConstrainedBox(
    constraints: BoxConstraints.tightFor(
      width: double.infinity,
      height: 53,
    ),
    child: ElevatedButton(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: textColor,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    ),
  );
}

class ShowLend extends StatefulWidget {
  @override
  _ShowLendState createState() => _ShowLendState();
}

class _ShowLendState extends State<ShowLend> {
  SharedPreferences _preferences;

  Future<void> _setPreferences() async {
    setState(() async {
      _preferences = await SharedPreferences.getInstance();
    });
  }

  @override
  void initState() {
    super.initState();
    _setPreferences();
  }

  Future<void> _showMyBottomSheet(LendModel lend) async {
    final userName = _preferences.getString('username');
    final userEmail = _preferences.getString('useremail');

    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          height: 320,
          color: lightColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.warning_amber_rounded,
                  size: 50,
                ),
                Text(
                  'Confirmação de empréstimo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Você realmente se compromete em emprestar o ${lend.title} para ${lend.user.name}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    modalButton(
                      color: secondaryColor,
                      onPressed: () {
                        final String message =
                            'Olá ${lend.user.name}, meu nome é $userName e eu posso te ajudar!';
                        FlutterOpenWhatsapp.sendSingleMessage(
                          lend.user.whatsapp,
                          message,
                        );
                      },
                      title: 'Sim, quero emprestar',
                      textColor: lightColor,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    modalButton(
                      color: dangerColor.withOpacity(0.4),
                      onPressed: () => Navigator.pop(context),
                      title: 'Não, quero voltar atrás',
                      textColor: dangerColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final LendModel lend = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: lightColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Image(
                image: NetworkImage(lend.user.photo),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: secondaryLightColor,
                          size: 30,
                        ),
                        Text(
                          lend.user.rating,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            color: grayColor,
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 45, thickness: 1),
                    Text(
                      '${lend.user.name} solicita um ${lend.title} emprestado.',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: grayColor,
                      ),
                    ),
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            lend.category.title,
                            style: TextStyle(color: lightColor),
                          ),
                          backgroundColor: secondaryLightColor,
                        ),
                        VerticalDivider(
                          width: 20,
                          color: grayColor,
                          thickness: 1,
                          endIndent: 17,
                          indent: 17,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today_outlined),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.0),
                              child: Text(
                                '${Dates.formatDateDDMM(lend.startDate)} até ${Dates.formatDateDDMM(lend.endDate)}',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      lend.description,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Button(
                      title: 'Emprestar',
                      onPressedHandler: () => _showMyBottomSheet(lend),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
