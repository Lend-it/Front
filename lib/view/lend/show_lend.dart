import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/theme/colors.dart';

import '../../theme/colors.dart';
import '../../widgets/button.dart';

class ShowLend extends StatefulWidget {
  @override
  _ShowLendState createState() => _ShowLendState();
}

class _ShowLendState extends State<ShowLend> {
  @override
  Widget build(BuildContext context) {
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
                image: NetworkImage(
                  'https://avatars.githubusercontent.com/u/42722634?s=460&u=5dc66aaf59dbaf2e3e68c931cca641a44b5fd9fc&v=4',
                ),
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
                          '4,8',
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
                      'José da Silva solicita um Banco Imobiliário emprestado.',
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
                            'Jogos',
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
                                '20/02 até 22/02',
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
                      'Queria um banco imobiliário emprestado para jogar com meus amigos neste fim de semana, prometo que vou cuidar muito bem',
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
