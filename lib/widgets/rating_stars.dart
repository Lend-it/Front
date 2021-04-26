import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class RatingStars extends StatefulWidget {
  final int maxRating;
  final Function(int) onRatingSelected;

  RatingStars(this.onRatingSelected, [this.maxRating = 5]);

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  int _currentRating = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return Icon(
        Icons.star,
        color: secondaryColor,
        size: 35,
      );
    } else {
      return Icon(
        Icons.star,
        color: secondaryTransparentColor,
        size: 35,
      );
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(this.widget.maxRating, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRating = index + 1;
          });
          this.widget.onRatingSelected(_currentRating);
        },
      );
    });
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
