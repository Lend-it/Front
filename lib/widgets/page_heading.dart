import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class PageHeading extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool inverted;

  const PageHeading({
    @required this.title,
    this.subtitle,
    this.inverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline2.copyWith(
                color: this.inverted ? lightColor : darkColor,
              ),
        ),
        SizedBox(height: 8),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: this.inverted ? lightColor : darkColor,
              ),
        ),
      ],
    );
  }
}
