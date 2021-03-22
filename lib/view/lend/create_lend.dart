import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/lend.controller.dart';
import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:front/widgets/PageHeading.dart';
import 'package:front/widgets/button.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';

class CreateLend extends StatefulWidget {
  final LendModel lend;
  final String title;
  final String subtitle;

  CreateLend({
    Key key,
    this.lend,
    this.title,
    this.subtitle,
  });

  @override
  _CreateLendState createState() => _CreateLendState();
}

class _CreateLendState extends State<CreateLend> {
  TextEditingController _nameController;
  TextEditingController _descriptionController;
  DateTimeRange _dateTimeRange;

  String _selectValue;
  String _selectTitle;

  LendController lendController = new LendController();
  NotificationPopup notificationPopup = new NotificationPopup();

  List<S2Choice<String>> _options;

  @override
  void initState() {
    super.initState();

    if (widget.lend == null) {
      _nameController = TextEditingController();
      _descriptionController = TextEditingController();
      _dateTimeRange =
          DateTimeRange(start: DateTime.now(), end: DateTime.now());
      _selectValue = null;
      _selectTitle = 'Categorias';
    } else {
      _nameController = TextEditingController(text: widget.lend.title);
      _descriptionController =
          TextEditingController(text: widget.lend.description);
      _dateTimeRange = DateTimeRange(
        start: DateTime.parse(widget.lend.startDate),
        end: DateTime.parse(widget.lend.endDate),
      );
      _selectValue = widget.lend.category.id;
      _selectTitle = widget.lend.category.title;
    }

    final List<CategoryModel> categories = [
      CategoryModel(id: '0', title: 'Mais próximo'),
      CategoryModel(id: '1', title: 'Jogos'),
      CategoryModel(id: '2', title: 'Eletrodomésticos'),
      CategoryModel(id: '3', title: 'Ferramentas'),
      CategoryModel(id: '4', title: 'Pets'),
    ];

    _options = categories
        .map(
          (category) =>
              S2Choice<String>(value: category.id, title: category.title),
        )
        .toList();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // function for select date range
  Future<Null> selectDate(BuildContext context) async {
    final DateTimeRange picked = await showDateRangePicker(
      context: context,
      initialDateRange: _dateTimeRange,
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
              child: PageHeading(
                title: widget.title,
                subtitle: widget.subtitle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 57,
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: whiteDarkColor),
                        ),
                        hintText: 'Nome do produto',
                        hintStyle: TextStyle(color: grayColor),
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
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 57,
                    decoration: BoxDecoration(
                      border: Border.all(color: whiteDarkColor, width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: SmartSelect.single(
                      tileBuilder: (context, state) {
                        return S2Tile(
                          trailing: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: primaryColor,
                            size: 35,
                          ),
                          title: state.titleWidget,
                          value: state.valueDisplay,
                          onTap: state.showModal,
                          hideValue: true,
                        );
                      },
                      modalType: S2ModalType.popupDialog,
                      title: _selectTitle,
                      value: _selectValue,
                      choiceItems: _options,
                      modalHeader: false,
                      choiceStyle: S2ChoiceStyle(
                        color: secondaryColor,
                        activeColor: secondaryColor,
                      ),
                      onChange: (state) => setState(() {
                        _selectValue = state.value;
                        _selectTitle = _options
                            .firstWhere(
                                (element) => element.value == state.value)
                            .title;
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      selectDate(context);
                    },
                    child: Container(
                      height: 57,
                      padding: EdgeInsets.only(
                        left: 16,
                        right: 22,
                        top: 12,
                        bottom: 14,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: whiteDarkColor, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
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
                  SizedBox(height: 20),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(color: whiteDarkColor),
                      ),
                      hintText: 'Descrição',
                      hintStyle: TextStyle(color: grayColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryLightColor,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: whiteDarkColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Button(
                    title: widget.title,
                    onPressedHandler: () async {
                      final requestLend = LendModel(
                        id: widget.lend.id,
                        user: widget.lend.user,
                        category: CategoryModel(
                          title: _selectTitle,
                          id: _selectValue,
                        ),
                        description: _descriptionController.text,
                        endDate: _dateTimeRange.end.toString(),
                        startDate: _dateTimeRange.start.toString(),
                        title: _nameController.text,
                      );

                      final Response response =
                          await lendController.createNewLend(requestLend);

                      if (response.statusCode != 201) {
                        notificationPopup.notificate(
                          context: context,
                          title: 'Não foi possível realizar a ação',
                          status: 'fail',
                        );
                      } else {
                        notificationPopup.notificate(
                          context: context,
                          title: 'Ação realizada com sucesso',
                          status: 'success',
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
