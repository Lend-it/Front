import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/utils/confirm_modal.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  LendController lendController = new LendController();
  List<LendModel> lends = [];

  void getAllLends() async {
    final List<LendModel> response = await lendController.getLends();
    setState(() {
      lends = response;
    });
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
        title: Text('Notice'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: () => ConfirmModal.showConfirmModal(
              context: context,
              lend: lends[4],
              title: 'Confirmação de devolução.',
              subtitle:
                  'Você realmente quer devolver o ${lends[4].title} para ${lends[4].requester.name}?',
              confirmButtonText: 'Sim, quero devolver',
              declineButtonText: 'Não, quero voltar atrás',
              confirmPressed: () async {
                await lendController.finalizeLend(lends[4].id);
              },
            ),
            child: Text('finalizar lend'),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
