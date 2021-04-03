import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/session.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/confirm_modal.dart';
import 'package:front/utils/dates.dart';
import 'package:provider/provider.dart';

import '../../theme/colors.dart';
import '../../widgets/button.dart';

class ShowLend extends StatefulWidget {
  @override
  _ShowLendState createState() => _ShowLendState();
}

class _ShowLendState extends State<ShowLend> {
  LendController lendController = new LendController();

  @override
  Widget build(BuildContext context) {
    final LendModel lend = ModalRoute.of(context).settings.arguments;
    final SessionModel session =
        Provider.of<SessionModel>(context, listen: false);
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
                image: NetworkImage(lend.requester.photo),
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
                          lend.requester.rating,
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
                      '${lend.requester.name} solicita um ${lend.title} emprestado.',
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
                      onPressedHandler: () => ConfirmModal.showConfirmModal(
                        context: context,
                        lend: lend,
                        title: 'Confirmação de empréstimo',
                        subtitle:
                            'Você realmente se compromete em emprestar o ${lend.title} para ${lend.requester.name}?',
                        confirmButtonText: 'Sim, quero emprestar',
                        declineButtonText: 'Não, quero voltar atrás',
                        confirmPressed: () async {
                          await lendController.updateLender(
                            session.user.id,
                            lend.id,
                          );

                          final String message =
                              'Olá ${lend.requester.name}, meu nome é ${session.user.name} e eu posso te ajudar!';
                          FlutterOpenWhatsapp.sendSingleMessage(
                            lend.requester.whatsapp,
                            message,
                          );
                        },
                      ),
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
