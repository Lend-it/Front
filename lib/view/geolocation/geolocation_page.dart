import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/theme/colors.dart';
import 'package:front/widgets/PageHeading.dart';
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
      header: SvgPicture.asset(
        'assets/logo.svg',
        width: 150,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          SvgPicture.asset(
            'assets/location.svg',
            width: 400,
          ),
          PageHeading(
            title: 'Precisamos saber onde mora!',
            subtitle:
                'Usamos a localização para filtrar os pedidos próximos e avisar os seus vizinhos quando você pedir algo emprestado.',
          ),
          SizedBox(height: 80),
          Button(title: "Permitir localização", onPressedHandler: () {}),
        ],
      ),
    );
  }
}
