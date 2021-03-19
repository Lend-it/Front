import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/theme/colors.dart';
import 'package:front/widgets/base_page.dart';
import 'package:front/widgets/button.dart';

class GeolocationPage extends StatefulWidget {
  @override
  _GeolocationPageState createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          SvgPicture.asset(
            'assets/location.svg',
            width: 400,
          ),
          Text(
            "Precisamos saber onde mora!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkColor,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Usamos a localização para filtrar os pedidos próximos e avisar os seus vizinhos quando você pedir algo emprestado.",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: darkColor,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 80),
          Button(title: "Permitir localização", onPressedHandler: () {})
        ],
      ),
    );
  }
}
