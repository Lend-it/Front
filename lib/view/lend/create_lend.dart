import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/theme/colors.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/input.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';

class CreateLend extends StatefulWidget {
  @override
  _CreateLendState createState() => _CreateLendState();
}

class _CreateLendState extends State<CreateLend> {
  TextEditingController _nameController;
  DateTimeRange _dateTimeRange;

  String selectValue = "Ion";
  String selectTitle = "Ionic";
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'ion', title: 'Ionic'),
    S2Choice<String>(value: 'flu', title: 'Flutter'),
    S2Choice<String>(value: 'rea', title: 'React Native'),
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTimeRange picked = await showDateRangePicker(
      context: context,
      initialDateRange:
          DateTimeRange(start: DateTime.now(), end: DateTime.now()),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _dateTimeRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: lightColor,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Criar pedido',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            subtitle: Text(
              'Peça ajuda! Preencha esse formulário para solicitar o empréstimo de um produto.',
              style: TextStyle(fontSize: 16, color: darkColor),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Input(
                  placeholder: "Nome do Produto",
                  type: TextInputType.text,
                  icon: null,
                  controller: _nameController,
                ),
                SmartSelect.single(
                  tileBuilder: (context, state) {
                    return S2Tile(
                      trailing: Icon(Icons.keyboard_arrow_down_outlined),
                      title: state.titleWidget,
                      value: state.valueDisplay,
                      onTap: state.showModal,
                      hideValue: true,
                    );
                  },
                  modalType: S2ModalType.popupDialog,
                  title: selectTitle,
                  value: selectValue,
                  choiceItems: options,
                  onChange: (state) => {
                    setState(
                      () {
                        selectValue = state.value;
                        selectTitle = state.title;
                      },
                    ),
                  },
                ),
                GestureDetector(
                  onTap: () {
                    selectDate(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 23,
                      right: 23,
                      top: 12,
                      bottom: 14,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: grayColor, width: 1),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '${DateFormat('dd/MM').format(_dateTimeRange.start)} até ${DateFormat('dd/MM').format(_dateTimeRange.end)}',
                          style: TextStyle(fontSize: 16, color: grayColor),
                        ),
                        Icon(
                          Icons.calendar_today,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: primaryLightColor,
                        width: 2.0,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(color: grayColor),
                    ),
                  ),
                ),
                Button(
                  title: 'Criar pedido',
                  onPressedHandler: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
