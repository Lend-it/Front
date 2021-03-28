import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/dates.dart';
import 'package:intl/intl.dart';
import 'dart:io';

import '../../theme/colors.dart';
import '../../widgets/button.dart';

class ShowLend extends StatefulWidget {
  @override
  _ShowLendState createState() => _ShowLendState();
}

class _ShowLendState extends State<ShowLend> {
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
                      onPressedHandler: () {},
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
