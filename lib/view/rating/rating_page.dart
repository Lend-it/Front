import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/model/session.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/dates.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/category_chip.dart';
import 'package:front/widgets/rating_stars.dart';
import 'package:provider/provider.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    final session = Provider.of<SessionModel>(context, listen: false);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        child: Image(
                          colorBlendMode: BlendMode.darken,
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(
                            'https://avatars.githubusercontent.com/u/31940073?v=4',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Avalie sua experiência com o Lucas, ao emprestar um Banco Imobiliário.',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: darkColor,
                          ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Chip(
                          label: Text(
                            'category',
                            style: TextStyle(color: lightColor),
                          ),
                          backgroundColor: secondaryLightColor,
                        ),
                        VerticalDivider(
                          width: 20,
                          color: grayColor,
                          thickness: 2,
                          endIndent: 17,
                          indent: 17,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.0),
                              child: Text('20/04 até 22/04'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Qual nota você daria para Lucas ?',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: darkColor,
                          ),
                    ),
                    SizedBox(height: 10),
                    RatingStars((rating) {}),
                    SizedBox(height: 30),
                    Text(
                      'Fale mais sobre sua experiência',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: darkColor,
                          ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(color: whiteDarkColor),
                        ),
                        hintText: 'Descrição',
                        hintStyle:
                            Theme.of(context).textTheme.bodyText2.copyWith(
                                  color: darkColor,
                                  fontSize: 14,
                                ),
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
                    SizedBox(height: 25),
                    Text(
                      'Deseja reportar a Lucas por algo grave?',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: darkColor,
                          ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        CategoryChip(
                          label: 'Sim',
                          onTapHandler: () {},
                        ),
                        SizedBox(width: 10),
                        CategoryChip(
                          label: 'Não',
                          onTapHandler: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Button(
                      title: 'Enviar avaliação',
                      onPressedHandler: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
