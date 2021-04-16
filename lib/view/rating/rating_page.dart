import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/controller/rating.controller.dart';
import 'package:front/model/rating.model.dart';
import 'package:front/model/session.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/widgets/button.dart';
import 'package:front/widgets/rating_stars.dart';
import 'package:provider/provider.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  TextEditingController _descriptionController;
  int rate;
  bool report;
  bool isSelectedY = false;
  bool isSelectedN = false;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _createRating(
      BuildContext context, int rate, bool report, SessionModel session) {
    print(_descriptionController);
    final RatingModel rating = new RatingModel(
      stars: rate,
      review: _descriptionController.text,
      report: report,
      reviewer: session.user.email,
      reviewed: 'rogerio@email.com',
      requestid: '8d27b6c1-ac8a-4f29-97b0-96cef6938267',
    );

    new RatingController().createNewRating(rating, context);
  }

  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionModel>(context, listen: false);
    Color chipColor = secondaryColor;
    Duration animationDuration = Duration(milliseconds: 300);

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
                    RatingStars((rating) {
                      rate = rating;
                    }),
                    SizedBox(height: 30),
                    Text(
                      'Fale mais sobre sua experiência',
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: darkColor,
                          ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: darkColor,
                            fontSize: 14,
                          ),
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
                            color: whiteDarkColor,
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
                        Container(
                          height: 32,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isSelectedY = true;
                                isSelectedN = false;
                              });
                              report = true;
                            },
                            child: AnimatedContainer(
                              duration: animationDuration,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: animationDuration,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        color: chipColor,
                                      ),
                                  child: Text(
                                    'Sim',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          color: isSelectedY
                                              ? lightColor
                                              : secondaryColor,
                                        ),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isSelectedY ? secondaryColor : lightColor,
                                border: Border.all(
                                  color: secondaryColor,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 32,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isSelectedY = false;
                                isSelectedN = true;
                              });
                              report = false;
                            },
                            child: AnimatedContainer(
                              duration: animationDuration,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: animationDuration,
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption
                                      .copyWith(
                                        color: chipColor,
                                      ),
                                  child: Text(
                                    'Não',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          color: isSelectedN
                                              ? lightColor
                                              : secondaryColor,
                                        ),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: isSelectedN ? secondaryColor : null,
                                border: Border.all(
                                  color: secondaryColor,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Button(
                      title: 'Enviar avaliação',
                      onPressedHandler: () {
                        _createRating(context, rate, report, session);
                      },
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
